module Jsj
  class FormStruct
    class CustomField < Field

      # SPECIAL_FIELD_TYPE = [ "address", "goods"]

      def self.create(field_hash)
        # _field_identify = field_hash.keys.first
        # value_hash = field_hash[_field_identify]
        # _type = value_hash["type"]
        # if SPECIAL_FIELD_TYPE.include? _type
        #   _field_class_str = "Jsj::FormStruct::" + "#{_type}_field".classify
        #   _field_class_str.constantize.new(field_hash)
        # else
        #   Jsj::FormStruct::BaseCustomField.new(field_hash)
        # end
        Jsj::FormStruct::BaseCustomField.new(field_hash)

      end


    end
  end
end
