# frozen_string_literal: true

require 'active_support/test_case'

require_relative './stub_form_infos'
require_relative './create_confs'
require_relative './create_subjects'

class ActiveSupport::TestCase
  include CreateConfs
  include CreateSubjects

  def setup
    # create_subjects
    # create_confs
  end

  

end
