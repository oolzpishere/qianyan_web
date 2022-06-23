module CreateConfs

  def create_confs
    Backend::Conference.create([
      {
          subject_id: 1, 
          name: "2022春小学数学",
          full_name: "2022年春“前沿课堂”小学数学教学观摩研讨会",
          sms_conf_name: "小学数学",
          # eng_name: "two_primary_math",
          year: 2022,
          season: 'spring',
          subject_eng_name: "primary_math",
          start_date: "2022/5/26",
          finish_date: "2022/5/27"},
      { 
          subject_id: 2,
          name: "2022春小学语文",
          full_name: "2022年春“前沿课堂”小学语文教学观摩研讨会",
          sms_conf_name: "小学语文",
          # eng_name: "two_primary_chinese",
          year: 2022,
          season: 'spring',
          subject_eng_name: "primary_chinese",
          start_date: "2022/5/24",
          finish_date: "2022/5/25"},
      { 
          subject_id: 3,
          name: "2022春小学英语",
          full_name: "2022年春“前沿课堂”小学英语教学观摩研讨会",
          sms_conf_name: "小学英语",
          # eng_name: "two_primary_english",
          year: 2022,
          season: 'spring',
          subject_eng_name: "primary_english",
          start_date: "2022/5/30",
          finish_date: "2022/5/31"},
    ])

  end

end
