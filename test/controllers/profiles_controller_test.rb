require "test_helper"

class ProfilesControllerTest < ActionDispatch::IntegrationTest

  setup do
    @person = people(:ukiyoe)
  end

  test "GET :show" do
    get profile_path(@person.username)
    assert_response :success

    assert_select "h3", "Railsgram"
    assert_select ".post", count: @person.posts.count
  end

  test "GET unkown profile" do
    assert_raises ActiveRecord::RecordNotFound do
      get profile_path("godot")
    end
  end
end
