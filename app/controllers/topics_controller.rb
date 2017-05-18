class TopicsController < ApplicationController
  def index
    @topics = current_user.topics.all
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def new
  end

  def edit
  end
  
  def create
  end
  
  def destroy
  end
end
