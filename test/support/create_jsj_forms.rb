module CreateJsjForms

  def create_jsj_forms
    Backend::JsjForm.create([
      {
        id: 1,
        conference_id: 1,
        form_identify: "Pf5W3d",
        name: "小学数学",
        full_name: "2022年春“前沿课堂”全国小学数学教学观摩研讨会",
        description: "",
        form_type: "jsj_json",
        all_use_data_type: "jsj_json",
        sign_up_link: nil,
        form_struct: nil,
        xml_fields: nil,
        use_fields_type: nil,
      },
    ])

  end

end
