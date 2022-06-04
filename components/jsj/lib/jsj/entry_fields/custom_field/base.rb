module Jsj
  class EntryFields
    class CustomField
      class Base
        attr_reader :field_identify, :raw_value, :field_struct_hash, :label, :type

        def initialize(field_hash, field_struct_hash)
          # field_hash is string keys for all
          @field_identify = field_hash.keys.first
          @raw_value = field_hash[field_identify]

          @field_struct_hash = field_struct_hash
          @label = field_struct_hash["label"]
          @type = field_struct_hash["type"]
        end

        def humanize_value
          raw_value
        end


      end
    end
  end
end
