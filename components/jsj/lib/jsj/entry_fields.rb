module Jsj
  class EntryFields
    attr_reader :fields, :form_struct
    def initialize(entry_hash, form_struct)
      @fields = []
      @form_struct = form_struct

      init_fields(entry_hash.deep_stringify_keys)
    end

    def get_field(field_identify: nil, label: nil)
      if label
        search_field( :label, label )
      elsif field_identify
        search_field( :field_identify, field_identify )
      end
    end

    private

    def init_fields(entry_hash)
      entry_hash.each do |k, v|
        if field_struct(k)
          # new custom field
          _field_struct_hash = field_struct(k).field_struct_hash
          _field = Jsj::EntryFields::CustomField.create( {k => v}, _field_struct_hash )
        else
          # system field
          _field = Jsj::EntryFields::SystemField.new( [k, v] )
        end
        fields << _field
      end

    end

    def field_struct(k)
      form_struct.get_field(field_identify: k)
    end

    # search_by :label or :field_identify
    def search_field( search_by, search_value )
      fields.each do |field|
        return field if field.send(search_by).to_s == search_value.to_s
      end
      nil
    end


  end
end
