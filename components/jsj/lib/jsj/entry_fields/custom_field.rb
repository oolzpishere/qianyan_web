module Jsj
  class EntryFields
    class CustomField
      attr_reader :field_identify, :label, :type
      attr_accessor :raw_value

      # entry_field: ["serial_number", 3]
      SPECIAL_FIELD_TYPE = [ "address", "goods"]

      def self.create(field_hash, field_struct_hash)
        _field_identify = field_hash.keys.first
        _type = field_struct_hash["type"]
        if SPECIAL_FIELD_TYPE.include? _type
          _field_class_str = "Jsj::EntryFields::CustomField::" + "#{_type}_field".classify
          _field_class_str.constantize.new(field_hash, field_struct_hash)
        else
          Jsj::EntryFields::CustomField::Base.new(field_hash, field_struct_hash)
        end
      end


    end
  end
end
