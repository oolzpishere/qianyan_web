module Jsj
  class EntryFields
    class CustomField
      class GoodsField < Base

        def humanize_value
          products_array = raw_value
          products_array = products_array.map do |product|
            "#{product['name']} x #{product['number']}"
          end
          products_array.join(", ")

        end

      end
    end
  end
end
