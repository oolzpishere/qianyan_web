module CreateSubjects

  def create_subjects
    Backend::Subject.create([
        { id:1, name: "小学数学", eng_name: "primary_math" },
        { id:2, name: "小学语文", eng_name: "primary_chinese" },
        { id:3, name: "小学英语", eng_name: "primary_english" },
        { id:4, name: "初中数学", eng_name: "middle_math" },
        { id:5, name: "初中语文", eng_name: "middle_chinese" },
        { id:6, name: "初中英语", eng_name: "middle_english" },
        # { id:7, name: "高中数学", eng_name: "high_math" },
        # { id:8, name: "高中语文", eng_name: "high_chinese" },
        # { id:9, name: "高中英语", eng_name: "high_english" },
    ])

  end

end
