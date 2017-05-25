class UsersController < ApplicationController
  def show
    authorize (User.find_by id: params[:id] || current_user)

    @topics = current_user.topics.all
    @likes = current_user.likes.all
  end
end
