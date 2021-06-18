class ProfilesController < ApplicationController

  def show
    @profile = Profile.find_by!(username: params[:id])
    @posts = @profile.posts.has_picture.with_attached_picture.order(id: :desc).all
  end
end
