class PostsController < ApplicationController
  before_action :set_post, only: [:show, :update]

  def index
    @posts = Post.has_picture.with_attached_picture.order(id: :desc).all
  end

  def show
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to edit_post_picture_path(@post)
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:caption, :original_picture)
  end
end
