require "test_helper"

class PicturesControllerTest < ActionDispatch::IntegrationTest

  setup do
    @post = posts(:great_wave)
  end

  test "GET :edit" do
    get edit_post_picture_path(@post)
    assert_response :success
  end

  test "PATCH :update" do
    original_blob = @post.picture.blob

    picture_data = file_fixture("great_wave.jpg").read
    encoded = Base64.encode64(picture_data)

    patch post_picture_path(@post, params: {
      post: {
        picture_data: "data:image/jpg;base64,#{encoded}"
      }
    })
    assert_redirected_to edit_post_caption_path(@post)

    assert_not_equal original_blob.key, @post.reload.picture.blob.key
  end
end
