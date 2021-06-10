require "application_system_test_case"

class CreatePostTest < ApplicationSystemTestCase

  test "can create a new post" do
    visit root_path
    assert_css "h3", text: "Railsgram"

    upload_new_picture

    assert page.has_content?("New post")

    wait_until_preset_preview_is_applied
    find("#moon_preview").click
    wait_until_picture_data_field_is_not_empty
    click_next

    fill_in "post_caption", with: "This is the Mount Fuji in red"
    click_next

    assert_css "h3", text: "Railsgram"

    assert_equal "This is the Mount Fuji in red", Post.last.caption
  end

  private

  def upload_new_picture
    attach_file "post_original_picture", file_fixture("red_fuji.jpg").to_s, make_visible: true
  end

  def wait_until_preset_preview_is_applied
    assert page.has_css?("#moon_preset[data-preset-applied-value]")
  end

  def wait_until_picture_data_field_is_not_empty
    page.has_field?("post_picture_data", with: /.+/)
  end

  def click_next
    within "#header_form" do
      click_button "commit"
    end
  end
end
