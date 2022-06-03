# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
Account::Admin.create([
    { email: ENV["TEST_ADMIN_EMAIL"], password: ENV["TEST_APP_PASSWORD"], password_confirmation: ENV["TEST_APP_PASSWORD"], role: "admin"},
])

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