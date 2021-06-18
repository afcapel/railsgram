class ProfilesController < ApplicationController

  def show
    @person = Person.find_by!(username: params[:id])
    @posts = @person.posts.has_picture.with_attached_picture.order(id: :desc).all
  end
end
