class CaptionsController < ApplicationController
  before_action :load_post

  def edit
  end

  def update
    if @post.update(caption_params)
      redirect_to root_path
    else
      render "edit", status: :unprocessable_entity
    end
  end

  private

  def load_post
    @post = Post.find(params[:post_id])
  end

  def caption_params
    params.require(:post).permit(:caption)
  end
end
