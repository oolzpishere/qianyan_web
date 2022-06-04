module Jsj
  class JsjFields
    SPECIAL_FIELD_TYPE = [ "address", "goods"]
    attr_reader :entry_fields, :datum_hash

    def initialize(entry_fields, datum_hash)
      @entry_fields = entry_fields
      @datum_hash = datum_hash.deep_stringify_keys
    end

    # only accept one param, key or label
    def get_value(key: nil, label: nil)
      field = entry_fields.get_field(field_identify: key, label: label)
      field.humanize_value
    end

    private


  end
end
