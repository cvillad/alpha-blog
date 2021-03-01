require "test_helper"

class SignupUserTest < ActionDispatch::IntegrationTest

  test "get signup form and create user" do
    get signup_url
    assert_response :success
    assert_difference "User.count", 1 do
      post users_url, params: { user: {username: "test123", email: "test@gmail.com", password: "password"} }
      assert_response :redirect
    end
  end
end
