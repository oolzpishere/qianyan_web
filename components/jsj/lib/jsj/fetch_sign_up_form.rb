module Jsj
  module FetchSignUpForm

    def self.all_forms
      Jsj::FormInfos.all_forms.map {|form_hash| form_hash.merge({form_type: "jsj_json", all_use_data_type: "jsj_json"})}
    end

    def self.invoke_all
      all_forms.each do |hash|
        invoke( hash[:form_identify] )
      end
    end
    # invoke fetch, if form exist in db, only update which difference with db.
    def self.invoke(form_identify)
      results = send_request( form_api_url( form_identify ) )

      params = to_params(results).merge( pre_setting_params( find_pre_setting_form(form_identify)
) )
      # update, if exist and difference with db.
      sync_to_db(params)
    end

    private

    def self.send_request(url, payload = {}, options = {})
      response = RestClient::Request.execute(
        {
          method: :get,
          url: url,
          headers: { Authorization: "Basic " + Base64::encode64(auth_details) },
          payload: {}
        }.merge(options)
      )
      unless response_success?(response)
        raise "request fail, response code not eq 2**"
      end

      results = JSON.parse(response.to_str).deep_symbolize_keys
    end

    def self.response_success?(response)
      response && ( response.code.to_s.match(/^2/) )
    end

    FORM_API_BASE_URL = "https://jinshuju.net/api/v1/forms/"
    def self.form_api_url(form_identify)
      FORM_API_BASE_URL + form_identify
    end

    def self.auth_details
      ENV.fetch("JINSHUJU_API_KEY") + ":" + ENV.fetch("JINSHUJU_API_SECRET")
    end

    def self.pre_setting_params(form_hash)
      conf_id = find_conf( form_hash[:year], form_hash[:season], form_hash[:subject_eng_name] ).id
      {
       name: form_hash[:name],
       conference_id: conf_id,
       form_identify: form_hash[:form_identify],
       form_type: form_hash[:form_type],
       all_use_data_type: form_hash[:all_use_data_type]
     }
    end

    def self.to_params(results)
      {
        full_name: results[:name],
        description: results[:description],
        form_struct: results[:fields]
      }
    end

    def self.find_conf(year, season, subject_eng_name)
      # Backend::Conference.find_by(eng_name: conf_eng_name)
      Backend::Conference.find_by(year: year, season: season, subject_eng_name: subject_eng_name)
    end

    def self.find_pre_setting_form(form_identify)
      all_forms.find { |hash| hash[:form_identify] == form_identify }
    end

    def self.sync_to_db(params)
      new_form = Backend::JsjForm.new(params)

      if !find_in_db( params[:form_identify] )
        new_form.save
      else
        org_form = find_in_db( params[:form_identify] )
        if !same_with_org_form?(new_form, org_form)
          update_to_db(org_form, params)
        end
      end

    end

    def self.find_in_db(form_identify)
      Backend::JsjForm.find_by(form_identify: form_identify)
    end

    def self.same_with_org_form?(new_form, org_form)
      rejects = ["id", "created_at", "updated_at"]
      new_form_hash = new_form.attributes.reject { |k,v| rejects.include?(k) }
      org_form_hash = org_form.attributes.reject { |k,v| rejects.include?(k) }
      new_form_hash == org_form_hash
    end

    def self.update_to_db(org_form, params)
      org_form.update(params)
    end

  end
end
