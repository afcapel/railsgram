class PicturesController < ApplicationController

  before_action :load_post

  def edit
  end

  def update
    if post_params[:picture_data].present?
      @post.picture = attachment_params
    else
      @post.picture.attach @post.original_picture.blob
    end

    @post.save!

    redirect_to edit_post_caption_path(@post)
  end

  private

  def attachment_params
    metadata, data = post_params[:picture_data].split(',')
    decoded_data  = Base64.decode64(data)

    if metadata =~ /^data:(.*?);base64$/
      content_type = Regexp.last_match(1)
    end

    attachment = {
      io: StringIO.new(decoded_data),
      content_type: content_type,
      filename: @post.original_picture.filename.to_s
    }

    attachment
  end

  def load_post
    @post = Post.find(params[:post_id])
  end

  def post_params
    params.require(:post).permit(:picture_data)
  end
end
