class TopicsController < ApplicationController
  before_action :get_topic, only: [:show, :edit, :update, :destroy]
  
  def index
    @topics = current_user.topics.all
  end

  def show
    authorize @topic
  end

  def new
    @topic = Topic.new
  end
  
  def create
    @topic = current_user.topics.new(topic_params)
    
    authorize @topic
    
    if @topic.save
      flash[:notice] = "Topic was saved successfully."
      redirect_to action: :index
    else
      flash.now[:alert] = "Error creating topic. Please try again..."
      render :new
    end
  end
  
  def edit
  end
  
  def update
    @topic.assign_attributes(topic_params)
    
    authorize @topic
    
    if @topic.save
      flash[:notice] = "Topic was updated successfully."
      redirect_to action: :index
    else
      flash.now[:alert] = "Error updating topic. Please try again..."
      render :edit
    end
  end
  
  def destroy
    authorize @topic
    
    if @topic.destroy
      flash[:notice] = "\"#{@topic.title}\" was deleted successfully."
    else
      flash[:alert] = "There was an error deleting the topic."
    end
    redirect_to action: :index
  end
  
  private
  
  def topic_params
    params.require(:topic).permit(:title)
  end
  
  def get_topic
    @topic = Topic.find(params[:id])
  end
end
