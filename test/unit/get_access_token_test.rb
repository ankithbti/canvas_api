require 'test_helper'

class GetAccessTokenTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert GetAccessToken.new.valid?
  end
end
