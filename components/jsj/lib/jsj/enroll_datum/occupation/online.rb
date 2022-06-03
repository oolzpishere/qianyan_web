module Jsj
  module EnrollDatum
    module Occupation 
      class Online < Base 
        
        def occupation
          if raw_occupation.to_s.match("师范院校、普通院校在校学生")
            "student"
          else
            "teacher"
          end
        end

      end
    end
  end
end