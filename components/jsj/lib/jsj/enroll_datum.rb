module Jsj
  module EnrollDatum

    def self.create(raw_entry, sign_up_form)
      create_parser = Jsj::EnrollDatum::CreateParser.new(raw_entry, sign_up_form) 
      
      form_group_class = "Jsj::EnrollDatum::#{create_parser.form_group.to_s.classify}"
      form_group_class.constantize.create( 
        raw_entry, 
        create_parser.sign_up_form, 
        extra_opts: {
          way: create_parser.way, 
          occupation: create_parser.occupation, 
          province: create_parser.province 
        } 
      )
    end

    private

  end
end
