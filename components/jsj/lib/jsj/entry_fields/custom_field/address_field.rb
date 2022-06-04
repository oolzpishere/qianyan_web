module Jsj
  class EntryFields
    class CustomField
      class AddressField < Base

        def humanize_value
          raw_value.values.join(" ")
        end

      end
    end
  end
end
