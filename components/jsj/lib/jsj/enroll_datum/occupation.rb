module Jsj
  module EnrollDatum
    module Occupation 

      def self.create( raw_occupation, form_group: nil)
        case form_group.to_sym
        when :online
          Online.new(raw_occupation)
        when :online_only
          Online.new(raw_occupation)
        when :email
          Base.new("teacher")
        when :email_country
          Base.new("teacher")
        when :dong_shi
          Base.new("free_customer")
        else
          Base.new("teacher")
        end
      end




    end
  end
end
