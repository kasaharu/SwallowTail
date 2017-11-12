require 'test_helper'

class KeywordRepliesControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get keyword_replies_index_url
    assert_response :success
  end

end
