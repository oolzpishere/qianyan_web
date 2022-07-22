# frozen_string_literal: true

require 'active_support/test_case'

require_relative './stub_form_infos'
require_relative './create_confs'
require_relative './create_subjects'
require_relative './create_jsj_forms'
require_relative './create_attend_data'
require_relative './create_articles'

class ActiveSupport::TestCase
  include CreateConfs
  include CreateSubjects
  include CreateJsjForms
  include CreateAttendData
  include CreateArticles

  def setup
    # create_subjects
    # create_confs
  end

  def create_admin
    Account::Admin.create(
            { email: ENV["TEST_ADMIN_EMAIL"], 
              password: ENV["TEST_APP_PASSWORD"], password_confirmation: ENV["TEST_APP_PASSWORD"], 
              role: "admin"}
        )
  end

end
