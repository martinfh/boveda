require 'test_helper'

class CertificadoControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get certificado_show_url
    assert_response :success
  end

end
