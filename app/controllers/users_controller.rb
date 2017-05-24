class UsersController < ApplicationController
  def show
    # authorize current_user
    
    @topics = current_user.topics.all
    @likes = current_user.likes.all
  end
end
