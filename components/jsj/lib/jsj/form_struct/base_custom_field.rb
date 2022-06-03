module Jsj
  class FormStruct
    class BaseCustomField < CustomField
      attr_reader :field_struct_hash
      def initialize(field_hash)
        # field_hash is string keys for all
        @field_identify = field_hash.keys.first
        @field_struct_hash = field_hash[field_identify]

        @label = @field_struct_hash["label"]
        @type = @field_struct_hash["type"]
      end

    end
  end
end
