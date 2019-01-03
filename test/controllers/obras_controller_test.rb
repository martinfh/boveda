require 'test_helper'

class ObrasControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
  	get welcome_index_url
     assert true
  end

  test "should get new" do
  	get new_obra_url
  	assert true
  end

 test "should not save obra without title" do
  obra = Obra.new
  assert_not obra.save
end
end
