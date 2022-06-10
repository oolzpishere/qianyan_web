module Jsj
  module EnrollDatum
    class Base
      attr_reader :sign_up_form, :conference, :form_struct, :jsj_id, :entry, :use_data_type, :jsj_created_at, :jsj_updated_at, :unionid, :occupation_inst, :way_inst, :province_inst


      def initialize(entry, sign_up_form, extra_opts: {})
        # @sign_up_form = get_sign_up_form(sign_up_form)
        @sign_up_form = sign_up_form
        @conference = @sign_up_form.conference
        @entry = parse_entry(entry)

        @form_struct = Jsj::FormStruct.new(@sign_up_form)

        @jsj_fields = Jsj::JsjFields.new( Jsj::EntryFields.new( @entry, @form_struct ), @entry)

        @jsj_id = entry['serial_number']
        # @use_data_type default set by sign_up_form.
        # @use_data_type = 'jsj_json'
        @jsj_created_at = entry['created_at']
        @jsj_updated_at = entry['updated_at']

        @occupation_inst = extra_opts[:occupation]
        @way_inst = extra_opts[:way]
        @province_inst = extra_opts[:province]
      end


      def to_params
        {
          conference_id: conference.id,
          jsj_form_id: sign_up_form.id,

          name: name,
          phone: phone,
          email: email,
          school: school,
          location: province_inst.raw_province,
          way: way,
          occupation: occupation,
          # openid: openid,
          # unionid: ,

          payed: payed?,
          allow_to_print: allow_to_print?,

          # group: group,
          # timestamp: timestamp,

          jsj_id: jsj_id,
          entry: entry,
          # use_data_type: ,
          jsj_created_at: jsj_created_at,
          jsj_updated_at: jsj_updated_at,
        }
      end

      def get_datum(key: nil, label: nil)
        field_identify = if key
          key
        elsif label
          get_field_identify_by_label(label)
        end

        if field_identify
          entry[field_identify]
        else
          nil
        end
      end

      def get_humanize_value(key: nil, label: nil)
        jsj_fields.get_value(key: key, label: label)
      end

      # if don't have "参会方式" || "参会方式（现场/线上）" column, return nil.
      def way
        way_inst.name
      end

      def stream_code_sms_identify
        "#{conference.eng_name}_#{occupation}_stream_code"
      end

      def name
        @name ||= entry[get_field_identify_by_label('姓名')]
      end

      def phone
        @phone ||= entry[get_field_identify_by_label("手机")]
      end

      def email
        @email ||= entry[get_field_identify_by_label("邮箱")]
      end

      def openid
        @openid ||= (entry['x_field_weixin_openid'] ? entry['x_field_weixin_openid'] : nil)
      end

      def school
        @school ||= unless entry[get_field_identify_by_label("学校/单位名称")].blank? 
          entry[get_field_identify_by_label("学校/单位名称")] 
        else
          entry[get_field_identify_by_label("发票单位全称（开发票抬头）")]
        end
      end

      def sms_date_range
        start_date = conference.start_date
        finish_date = conference.finish_date
        start_date_zh = "#{start_date.month}月#{start_date.day}日"
        finish_date_zh = "#{finish_date.month}月#{finish_date.day}日"
        "#{start_date_zh}-#{finish_date_zh}"
      end

      def payed?
        trade_no = get_datum(key: 'trade_no')
        if !trade_no.blank?
          true
        elsif bank_transfer_confirm =  get_datum(label: "银行转账确认")
          # 银行转账确认: [已确认, 未收到]
          bank_transfer_confirm.match( /\A已确认/ )
        elsif email_bank_transfer_confirm =  get_datum(label: "银行转账确认（是/否）")
          # mail 银行转账确认（是/否）: [是, 否]
          email_bank_transfer_confirm.match( /\A是/ )
        else
          false
        end
      end
      
      def presend?
        send_status && send_status.match(/\A提前发送/) 
      end

      def manual_sent?
        send_status && send_status.match(/\A已手动发送/) 
      end

      def do_not_need_to_send?
        send_status && send_status.match(/\A不发送/)
      end

      def allow_to_print?
        if do_not_need_to_send?
          false
        elsif payed?
          true
        elsif presend?
          true
        elsif manual_sent?
          true
        else
          false
        end
      end

      def send_status
        get_datum(label: "直播密码发送状态")
      end

      def occupation
        @occupation ||= occupation_inst.name
      end

      def province
        @province ||= province_inst.name
      end

      private
      attr_reader :jsj_fields

      def get_sign_up_form(_sign_up_form)
        if _sign_up_form.is_a?(String)
          Backend::JsjForm.find_by(form_identify: _sign_up_form)
        else
          _sign_up_form
        end
      end

      def parse_entry(raw_entry)
        if raw_entry.is_a?(Hash)
          raw_entry
        else
          JSON.parse(raw_entry)
        end
      end

      def get_field_identify_by_label(label)
        if _field = form_struct.get_field(label: label)
          _field.field_identify
        end
      end


    end
  end
end
