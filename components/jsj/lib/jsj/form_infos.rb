module Jsj
  module FormInfos
    # Interface
    # @form_identify: String; jsj form identify
    # @@return: String; form_type name; eg. online
    def self.get_form_type(form_identify)
      _form_group = ""
      self.forms.each do |form_type, form_group|
        if form_group.any? {|form| form[:form_identify] == form_identify}
          _form_group = form_type.to_s
        end
      end
      _form_group
    end
    # Interface
    def self.get_form_group(type)
      self.forms[type.to_sym]
    end

    # Interface
    def self.all_forms
      _all_forms = []
      self.forms.each do |_, form_group|
        _all_forms += form_group
      end
      _all_forms
    end

    def self.get_form_info(form_identify)
      self.forms.each do |form_type, form_group|
        form_group.each do |form_hash|
          return form_hash if form_hash[:form_identify] == form_identify
        end
      end
    end
    # Interface
    def self.forms
      return Test::Support::StubFormInfos.forms if Rails.env.test?

      {
        online: [
          # {name: "初中数学", year: 2022, season: 'spring', subject_eng_name: "junior_high_math", form_identify: "CnMLWn"},
          # {name: "初中语文", year: 2022, season: 'spring', subject_eng_name: "junior_high_chinese", form_identify: "Itde1s"},
          # {name: "初中英语", year: 2022, season: 'spring', subject_eng_name: "junior_high_english", form_identify: "NaoJ6a"},
          {name: "小学数学", year: 2022, season: 'spring', subject_eng_name: "primary_math", form_identify: "Pf5W3d"},
          {name: "小学语文", year: 2022, season: 'spring', subject_eng_name: "primary_chinese", form_identify: "FQ8Zvn"},
          {name: "小学英语", year: 2022, season: 'spring', subject_eng_name: "primary_english", form_identify: "XAFecT"},
        ],
        # online_only: [
        #   {name: "小学语文(全国)", year: 2022, season: 'spring', subject_eng_name: "primary_chinese", form_identify: "gEWW4H"},
        #   {name: "小学英语(全国)", year: 2022, season: 'spring', subject_eng_name: "primary_english", form_identify: "OhZPxW"},
        #   {name: "小学数学(全国)", year: 2022, season: 'spring', subject_eng_name: "primary_math", form_identify: "HWVDO9"},
        # ],
        email: [
          # {name: "初中数学广西邮件", year: 2022, season: 'spring', subject_eng_name: "junior_high_math", form_identify: "i13lAp"},
          # {name: "初中语文广西邮件", year: 2022, season: 'spring', subject_eng_name: "junior_high_chinese", form_identify: "o1Pvxa"},
          # {name: "初中英语广西邮件", year: 2022, season: 'spring', subject_eng_name: "junior_high_english", form_identify: "JDbfDE"},
          {name: "小学数学广西邮件", year: 2022, season: 'spring', subject_eng_name: "primary_math", form_identify: "KQrHiJ"},
          # {name: "小学语文广西邮件", year: 2022, season: 'spring', subject_eng_name: "primary_chinese", form_identify: "GwGskJ"},
          {name: "小学英语广西邮件", year: 2022, season: 'spring', subject_eng_name: "primary_english", form_identify: "uybtiI"},
          {name: "小学语文广西学时证明", year: 2022, season: 'spring', subject_eng_name: "primary_chinese", form_identify: "kQHZyq"},
        ],
        email_country: [
          # {name: "初中数学全国邮件", year: 2022, season: 'spring', subject_eng_name: "junior_high_math", form_identify: "k1l6fA"},
          # {name: "初中语文全国邮件", year: 2022, season: 'spring', subject_eng_name: "junior_high_chinese", form_identify: "YkWDWl"},
          # {name: "初中英语全国邮件", year: 2022, season: 'spring', subject_eng_name: "junior_high_english", form_identify: "IccLaA"},
          {name: "小学数学全国邮件", year: 2022, season: 'spring', subject_eng_name: "primary_math", form_identify: "uW39GD"},
          {name: "小学语文全国邮件", year: 2022, season: 'spring', subject_eng_name: "primary_chinese", form_identify: "tb1epy"},
          {name: "小学英语全国邮件", year: 2022, season: 'spring', subject_eng_name: "primary_english", form_identify: "AqVfZf"},
          # {name: "小学英语（分会场）全国邮件", year: 2022, season: 'spring', subject_eng_name: "primary_english", form_identify: "dcfLNX"},
        ],
        dong_shi: [
          # {name: "初中数学东师", year: 2022, season: 'spring', subject_eng_name: "junior_high_math", form_identify: "wbFIaz"},
          # {name: "初中语文东师", year: 2022, season: 'spring', subject_eng_name: "junior_high_chinese", form_identify: "CWzA7v"},
          # {name: "初中英语东师", year: 2022, season: 'spring', subject_eng_name: "junior_high_english", form_identify: "lLeeyD"},
          {name: "小学数学东师", year: 2022, season: 'spring', subject_eng_name: "primary_math", form_identify: "sLGizo"},
          {name: "小学语文东师", year: 2022, season: 'spring', subject_eng_name: "primary_chinese", form_identify: "SeRre2"},
          {name: "小学英语东师", year: 2022, season: 'spring', subject_eng_name: "primary_english", form_identify: "Qgtl2U"},
        ],
        excel: [
          {name: "小学数学-excel", year: 2022, season: 'spring', subject_eng_name: "primary_math", form_identify: "2022_spring_primary_math1"},
          {name: "小学语文-excel", year: 2022, season: 'spring', subject_eng_name: "primary_chinese", form_identify: "2022_spring_primary_chinese1"},
          {name: "小学英语-excel", year: 2022, season: 'spring', subject_eng_name: "primary_english", form_identify: "2022_spring_primary_english1"},
        ]
      }
    end



  end
end
