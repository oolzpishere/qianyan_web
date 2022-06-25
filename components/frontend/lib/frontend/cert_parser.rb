module Frontend
  # maybe change to JsjCertParser
  class CertParser
    GUANGXI_CERT_BG_TYPE = "guangxi"
    COUNTRY_CERT_BG_TYPE = "country"

    attr_reader :attend_datum, :jsj_form, :conference
    def initialize(attend_datum)
      @attend_datum = get_attend_datum(attend_datum)
      @jsj_form = attend_datum.jsj_form
      @conference = attend_datum.conference
    end

    def cert_bg_type
      form_type = Jsj::FormInfos.get_form_type(jsj_form.form_identify)

      case form_type
      when 'email'
        GUANGXI_CERT_BG_TYPE 
      when 'email_country'
        COUNTRY_CERT_BG_TYPE
      when 'dongshi'
        COUNTRY_CERT_BG_TYPE
      when 'online'
        parsed_location
      else
        GUANGXI_CERT_BG_TYPE 
      end

      # find in form_infos,  guangxi email or country email
      # if online form, check raw_province
    end

    def start_date_str
      start_date = conference.start_date
      "#{start_date.strftime("%-m月%d日")}"
    end

    def date_range_str
      start_date = conference.start_date
      finish_date = conference.finish_date
      "#{start_date.strftime("%-m月%d")} - #{finish_date.strftime("%d日")}" 
    end

    def conference_name
      conference.name
    end

    def occupation
      attend_datum.occupation
    end

    private

    def get_attend_datum(_attend_datum)
      if _attend_datum.is_a?(Backend::AttendDatum)
        _attend_datum
      else
        Backend::AttendDatum.find_by(id: _attend_datum)
      end
    end 

    def parsed_location
      return GUANGXI_CERT_BG_TYPE if attend_datum.location.blank?
      
      if attend_datum.location.match("广西")
        GUANGXI_CERT_BG_TYPE 
      else
        COUNTRY_CERT_BG_TYPE
      end
    end

  end
end