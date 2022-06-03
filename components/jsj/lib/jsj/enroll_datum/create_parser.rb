module Jsj
  module EnrollDatum
    class CreateParser 

      attr_reader :sign_up_form, :form_struct, :entry

      def initialize(raw_entry, form_identify)
        @sign_up_form = get_sign_up_form(form_identify)
        @form_struct = Jsj::FormStruct.new(sign_up_form)
        @entry = parse_entry(raw_entry)
      end

      def form_group
        Jsj::FormInfos.get_form_type( sign_up_form.form_identify )
      end

      def way 
        _way =  unless get_datum(label: "参会方式").blank?
          get_datum(label: "参会方式")
        else 
          get_datum( label: "参会方式（现场/线上）")
        end
        Way.create( _way, form_group: form_group)
      end

      def occupation
        Occupation.create( get_datum(label: "参会人身份"), form_group: form_group)
      end

      def province
        _province = unless get_datum(label: "所在省份").blank?
          get_datum(label: "所在省份")
        else 
          get_datum(label: "所在地")
        end
        Province.create( _province, form_group: form_group)
      end

      private

      def get_sign_up_form(_sign_up_form)
        if _sign_up_form.is_a?(Backend::JsjForm)
          _sign_up_form
        else
          Backend::JsjForm.find_by(form_identify: _sign_up_form)
        end
      end

      def parse_entry(raw_entry)
        if raw_entry.is_a?(Hash)
          raw_entry
        else
          JSON.parse(raw_entry)
        end
      end

      def get_datum(key: nil, label: nil)
        field_identify = if key
          key
        elsif label
          get_field_identify_by_label( label )
        end

        if field_identify
          entry[field_identify]
        else
          nil
        end
      end

      def get_field_identify_by_label(label)
        if _field = form_struct.get_field(label: label)
          _field.field_identify
        end
      end

    end
  end
end
