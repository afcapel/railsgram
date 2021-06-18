require "test_helper"

class ProfilesControllerTest < ActionDispatch::IntegrationTest

  setup do
    @profile = profiles(:ukiyoe)
  end

  test "GET :show" do
    get profile_path(@profile.username)
    assert_response :success

    assert_select "h3", "Railsgram"
    assert_select ".post", count: @profile.posts.count
  end

  test "GET unkown profile" do
    assert_raises ActiveRecord::RecordNotFound do
      get profile_path("godot")
    end
  end
end
