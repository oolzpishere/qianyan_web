module Jsj
  class ExcelUpload

    attr_reader :attend_data, :headers, :form_identify

    def initialize(file_path)
      sheet = Roo::Excelx.new(file_path).sheet(0)
      @attend_data = sheet.parse(headers: true, skip_blanks: true)[1..-1]
      @headers = @attend_data.first.keys
      @form_identify = @attend_data[0]['form_identify']
    end

    def push_data
      form = find_or_create_form
      if form.blank?
        raise 'find_or_create_form fail, maybe do not have excel form info, or create form fail' 
      end
      attend_data.each do |datum|
        # _datum = datum.symbolize_keys
        Backend::AttendDatum.create({
          conference_id: conference.id,
          form_id: form.id,

          name: datum["姓名"],
          phone: datum["电话"],
          email: datum["邮箱"],
          school: datum["学校"],
          province: datum["省份"],
          location: datum["所在地"],
          way: datum["参会方式"],
          occupation: datum["身份"],
          # openid: openid,
          # unionid: ,

          payed: payed?(datum["银行转账确认"]),
          allow_to_print: allow_to_print?(datum["可打印证书"]),

          # group: group,
          # timestamp: timestamp,

          local_id: datum["序号"],
          # entry: entry,
          # use_data_type: ,
          # jsj_created_at: jsj_created_at,
          # jsj_updated_at: jsj_updated_at,
        })
      end

    end

    # change
    # delete
    # check
    
    private

    def find_or_create_form
      return false unless form_info

      form = Backend::Form.find_by(form_identify: form_identify)
      if form
        form
      else
        create_form
      end
    end

    def form_info
     @form_info ||= Jsj::FormInfos.get_form_info(form_identify) 
    end

    def create_form
      Backend::Form.create({
        conference_id: conference.id,
        form_identify: form_identify,
        name: form_info[:name],
        form_type: :excel
      })
    end

    def conference
      @conference ||= Backend::Conference.find_by( 
        year: form_info[:year], 
        season: form_info[:season], 
        subject_eng_name: form_info[:subject_eng_name] 
      )
    end

    def payed?(str)
      str == '是'
    end

    def allow_to_print?(str)
      str == '是'
    end

  end
end