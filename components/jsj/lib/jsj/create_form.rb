module Jsj
  class CreateForm

    attr :form_identify
    def initialize(form_identify)
      @form_identify = form_identify
    end

    def find_or_create_form
      return false unless form_info

      form = Backend::Form.find_by(form_identify: form_identify)
      if form
        form
      else
        create_form
      end
    end

    private

    def form_info
     @form_info ||= Jsj::FormInfos.get_form_info(form_identify) 
    end

    def create_form
      Backend::Form.create({
        conference_id: conference.id,
        form_identify: form_identify,
        name: form_info[:name],
        form_type: 'excel'
      })
    end

    def conference
      @conference ||= Backend::Conference.find_by( 
        year: form_info[:year], 
        season: form_info[:season], 
        subject_eng_name: form_info[:subject_eng_name] 
      )
    end

  end
end