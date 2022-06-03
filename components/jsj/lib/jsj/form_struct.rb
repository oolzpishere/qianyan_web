module Jsj
  class FormStruct
    attr_reader :sign_up_form, :name, :description, :fields
    def initialize(sign_up_form)
      @sign_up_form = (sign_up_form.is_a?(String) ? Backend::JsjForm.find_by(form_identify: sign_up_form) : sign_up_form)

      @name = @sign_up_form.name
      @description = @sign_up_form.description

      set_fields
    end

    def get_field(field_identify: nil, label: nil)
      if label
        search_field(fields, :label, label)
      elsif field_identify
        search_field(fields, :field_identify, field_identify)
      end
    end

    def auto_search_field(name)
      if name.is_a?(Symbol)
        search_field(fields, :field_identify, name)
      else
        search_field(fields, :label, name)
      end
    end

    def custom_field?( field_identify )
      !!search_field(fields, :field_identify, field_identify)
    end

    private

    def set_fields
      _form_struct = parse_form_struct
      @fields = _form_struct.map do |field_hash|
        field = create_custom_field(field_hash)
      end
    end

    def create_custom_field(field_hash)
      CustomField.create(field_hash)
    end

    def parse_form_struct
      if @sign_up_form.form_struct.is_a?(Hash) || @sign_up_form.form_struct.is_a?(Array)
        @sign_up_form.form_struct
      else
        JSON.parse(@sign_up_form.form_struct)
      end
    end
    # search_by :label or :field_identify
    def search_field(fields_array, search_by, search_value)
      fields_array.each do |field|
        return field if field.send(search_by).to_s == search_value.to_s
      end
      nil
    end

  end
end
