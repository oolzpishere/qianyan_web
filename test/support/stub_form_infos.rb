module Test
  module Support
    module StubFormInfos

      def self.forms
        {
          online: [
            {name: "小学英语", conf_eng_name: "twenty_one_primary_english", form_identify: "XAFecT"}
          ],

          online_only: [
            {name: "小学语文(全国)", conf_eng_name: "two_primary_chinese", form_identify: "gEWW4H"},
            {name: "初中数学", conf_eng_name: "twenty_one_junior_high_math", form_identify: "yMGJyp"},
            {name: "初中语文", conf_eng_name: "twenty_one_junior_high_chinese", form_identify: "J8Dn9E"},
            {name: "初中英语", conf_eng_name: "twenty_one_junior_high_english", form_identify: "vutO2s"},
            {name: "小学数学", conf_eng_name: "twenty_one_primary_math", form_identify: "g2ywVL"},
            {name: "小学语文", conf_eng_name: "twenty_one_primary_chinese", form_identify: "nezjFn"},
            {name: "小学英语", conf_eng_name: "twenty_one_primary_english", form_identify: "iArAhn"}
          ],

          email: [
            {name: "初中数学广西邮件", conf_eng_name: "twenty_one_junior_high_math", form_identify: "skjWxG"},
            {name: "初中语文广西邮件", conf_eng_name: "twenty_one_junior_high_chinese", form_identify: "gnZbGu"},
            {name: "初中英语广西邮件", conf_eng_name: "twenty_one_junior_high_english", form_identify: "Bgx8D0"},
            {name: "小学数学广西邮件", conf_eng_name: "twenty_one_primary_math", form_identify: "lz38NG"},
            {name: "小学语文广西邮件", conf_eng_name: "twenty_one_primary_chinese", form_identify: "LFjjT0"},
            {name: "小学英语广西邮件", conf_eng_name: "twenty_one_primary_english", form_identify: "xAeZKf"},

            {name: "小学数学广西邮件", conf_eng_name: "two_primary_math", form_identify: "KQrHiJ"},
            {name: "小学语文广西邮件", conf_eng_name: "two_primary_chinese", form_identify: "GwGskJ"},
            {name: "小学英语广西邮件", conf_eng_name: "two_primary_english", form_identify: "uybtiI"},
          ],

          email_country: [
            # {name: "初中数学全国邮件", conf_eng_name: "twenty_one_junior_high_math", form_identify: "miWTGY"},
            # {name: "初中语文全国邮件", conf_eng_name: "twenty_one_junior_high_chinese", form_identify: "OR3uLW"},
            # {name: "初中英语全国邮件", conf_eng_name: "twenty_one_junior_high_english", form_identify: "I79ZOe"},
            # {name: "小学数学全国邮件", conf_eng_name: "twenty_one_primary_math", form_identify: "n23KRX"},
            # {name: "小学语文全国邮件", conf_eng_name: "twenty_one_primary_chinese", form_identify: "ORcE2g"},
            # {name: "小学英语全国邮件", conf_eng_name: "twenty_one_primary_english", form_identify: "MJa1uh"},
            
            {name: "小学数学全国邮件", conf_eng_name: "two_primary_math", form_identify: "uW39GD"},
            {name: "小学语文全国邮件", conf_eng_name: "two_primary_chinese", form_identify: "tb1epy"},
            {name: "小学英语全国邮件", conf_eng_name: "two_primary_english", form_identify: "AqVfZf"},
          ],

          dong_shi: [
            {name: "初中数学东师", conf_eng_name: "twenty_one_junior_high_math", form_identify: "doVczS"},
            {name: "初中语文东师", conf_eng_name: "twenty_one_junior_high_chinese", form_identify: "zJBZWa"},
            {name: "初中英语东师", conf_eng_name: "twenty_one_junior_high_english", form_identify: "tkdpXg"},
            {name: "小学数学东师", conf_eng_name: "twenty_one_primary_math", form_identify: "LN1fB6"},
            {name: "小学语文东师", conf_eng_name: "twenty_one_primary_chinese", form_identify: "BLdqV3"},
            {name: "小学英语东师", conf_eng_name: "twenty_one_primary_english", form_identify: "JXHa82"},
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
end
