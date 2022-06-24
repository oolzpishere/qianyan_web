module Backend
  module CombineForm
    class Base

      attr_reader :form
      def initialize(form)
        @form = form
        init_record_delegate
      end

      def foreign_key
        table_name + '_id'
      end

      def init_record_delegate
        form.class.columns.map(&:name).each do |column_name|
          class_eval <<-CODE, __FILE__, __LINE__ + 1
            def #{column_name}
              form.send( :#{column_name} )
            end
          CODE
        end
      end

      # return "jsj_form"
      def table_name
        classes[-1].underscore
      end

      private
      # return ["Backend", "JsjForm"]
      def classes
        form.class.to_s.split('::')
      end 
      


    end
  end
end