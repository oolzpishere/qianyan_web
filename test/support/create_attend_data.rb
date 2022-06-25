module CreateAttendData

  def create_attend_data
    Backend::AttendDatum.create([
      {
        conference_id: 1,
        jsj_form_id: 1,
        name: "测试1",
        phone: "12345678901",
        email: "test1@qq.com",
        school: "测试学校1",
        province: nil,
        location: "广西壮族自治区",
        way: "online",
        occupation: "teacher",
        openid: nil,
        unionid: nil,
        payed: true,
        allow_to_print: true,
        certification_number: nil,
        cert_bg_type: nil,
        group: nil,
        timestamp: nil,
        jsj_id: 1,
        entry: nil,
        deleted: nil,
        trade_no: nil,
        bank_transfer_confirm: nil,
        jsj_created_at: nil,
        jsj_updated_at: nil, 
        created_at: nil,
        updated_at: nil
      },
      {
        conference_id: 1,
        jsj_form_id: 1,
        name: "测试2",
        phone: "12345678902",
        email: "test2@qq.com",
        school: "测试学校2",
        province: nil,
        location: "天津市",
        way: "online",
        occupation: "teacher",
        openid: nil,
        unionid: nil,
        payed: true,
        allow_to_print: true,
        certification_number: nil,
        cert_bg_type: nil,
        group: nil,
        timestamp: nil,
        jsj_id: 1,
        entry: nil,
        deleted: nil,
        trade_no: nil,
        bank_transfer_confirm: nil,
        jsj_created_at: nil,
        jsj_updated_at: nil, 
        created_at: nil,
        updated_at: nil
      }, 
    ])

  end

end
