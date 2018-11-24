require 'test_helper'

class GaleriasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get galerias_index_url
    assert_response :success
  end

end
