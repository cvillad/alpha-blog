require "test_helper"

class PagesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @category = Category.create(name: "Sports")
  end
  
  test "should get new" do
    get signup_url
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count', 1) do
      post users_url, params: { user: {username: "test123", email: "test@gmail.com", password: "password"} }
    end
    assert_redirected_to articles_url
  end

end
