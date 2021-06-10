require "test_helper"

class PostControllerTest < ActionDispatch::IntegrationTest

  test "GET :index" do
    get posts_path
    assert_response :success

    assert_select "h3", "Railsgram"
    assert_select ".post", count: Post.count
  end

  test "GET :show" do
    post = posts(:red_fuji)

    get post_path(post)
    assert_response :success

    assert_select "#post_#{post.id}"
  end

  test "POST :create" do
    assert_changes -> { Post.count } do
      post posts_path, params: { post: {
        original_picture: fixture_file_upload("great_wave.jpg", "image/jpg")
      }}
    end

    assert_redirected_to edit_post_picture_path(Post.last)
  end
end
