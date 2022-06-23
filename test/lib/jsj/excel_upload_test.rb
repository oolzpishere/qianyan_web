require "test_helper"

module Jsj
  class ExcelUploadTest  < ActionDispatch::IntegrationTest

    def setup
      create_subjects
      create_confs
    end

    def teardown
    end

    test 'success upload' do
      Jsj::ExcelUpload.new('./test/files/excel_upload_test.xlsx').push_data

      puts Backend::AttendDatum.first
  
      assert_equal 1, Backend::Form.count 

      first_datum_attrs = { "conference_id"=>1, "jsj_form_id"=>nil, "name"=>"测试1", "phone"=>"12345678901", "email"=>"test1@qq.com", "school"=>"测试学校1",
        "province"=>nil, "location"=>"广西南宁青秀区青秀路10号", "way"=>"现场", "occupation"=>nil, "openid"=>nil, "unionid"=>nil, "payed"=>true, "allow_to_print"=>true,
        "certification_number"=>nil, "cert_bg_type"=>nil, "group"=>nil, "timestamp"=>nil, "jsj_id"=>nil, "entry"=>nil, "deleted"=>nil, "trade_no"=>nil, "bank_transfer_confirm"=>nil, 
        "jsj_created_at"=>nil, "jsj_updated_at"=>nil, "form_id"=>1, "local_id"=>1}
      second_datum_attrs = { "conference_id"=>1, "jsj_form_id"=>nil, "name"=>"测试2", "phone"=>"12345678902", "email"=>"test2@qq.com", "school"=>"测试学校2",
        "province"=>nil, "location"=>"广西南宁青秀区青秀路10号", "way"=>"线上", "occupation"=>nil, "openid"=>nil, "unionid"=>nil, "payed"=>false, "allow_to_print"=>false,
         "certification_number"=>nil, "cert_bg_type"=>nil, "group"=>nil, "timestamp"=>nil, "jsj_id"=>nil, "entry"=>nil, "deleted"=>nil, "trade_no"=>nil, "bank_transfer_confirm"=>nil,
        "jsj_created_at"=>nil, "jsj_updated_at"=>nil, "form_id"=>1, "local_id"=>2}
      
      assert_equal first_datum_attrs, Backend::AttendDatum.first.attributes.except("id", "created_at", "updated_at")
      assert_equal second_datum_attrs, Backend::AttendDatum.second.attributes.except("id", "created_at", "updated_at")
    end

  end
end