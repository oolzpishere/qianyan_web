# frozen_string_literal: true

require 'active_support/test_case'

require_relative './stub_form_infos'
require_relative './create_confs'
require_relative './create_subjects'
require_relative './create_jsj_forms'
require_relative './create_attend_data'

class ActiveSupport::TestCase
  include CreateConfs
  include CreateSubjects
  include CreateJsjForms
  include CreateAttendData

  def setup
    # create_subjects
    # create_confs
  end

  

end
