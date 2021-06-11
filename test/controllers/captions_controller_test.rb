require "test_helper"

class CaptionsControllerTest < ActionDispatch::IntegrationTest

  setup do
    @post = posts(:great_wave)
  end

  test "GET :edit" do
    get edit_post_caption_path(@post)
    assert_response :success
  end

  test "PATCH :update" do
    patch post_caption_path(@post), params: {
      post: { caption: "Updated caption!" }
    }

    assert_redirected_to root_path

    assert_equal  "Updated caption!", @post.reload.caption
  end
end
