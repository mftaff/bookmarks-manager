class BookmarksController < ApplicationController
  before_action :get_bookmark, only: [:show, :edit, :update, :destroy]
  before_action :get_parent_topic, only: [:new, :create, :edit]
  
  def show
    authorize @bookmark
  end

  def new
    @bookmark = Bookmark.new
  end
  
  def create
    @bookmark = @topic.bookmarks.new(bookmark_params)

    authorize @bookmark

    if @bookmark.save
      flash[:notice] = "New Bookmark added to #{@bookmark.topic.title}"
      redirect_to topics_path
    else
      flash.now[:alert] = "Error creating Bookmark. Please try again..."
      render :new
    end
  end

  def edit
  end
  
  def update
    @bookmark.assign_attributes(bookmark_params)
    
    authorize @bookmark
    
    if @bookmark.save
      flash[:notice] = "Bookmark updated successfully."
      redirect_to topics_path
    else
      flash.now[:alert] = "Error updating bookmark. Please try again..."
      render :edit
    end
  end
  
  def destroy
    authorize @bookmark
    
    if @bookmark.destroy
      flash[:notice] = "Bookmark deleted successfully."
    else
      flash[:alert] = "There was an error deleting the Bookmark."
    end
    redirect_to topics_path
  end
  
  private
  
  def bookmark_params
    params.require(:bookmark).permit(:url)
  end
  
  def get_bookmark
    @bookmark = Bookmark.find(params[:id])
  end
  
  def get_parent_topic
    @topic = Topic.find(params[:topic_id])
  end
end
