class LikesController < ApplicationController
  before_action :get_bookmark, only: [:create, :destroy]
  
  def index
    @likes = current_user.likes.all
    log_info @likes.inspect
  end
  
  def create
    @like = current_user.likes.build(bookmark: @bookmark)
    
    authorize @like
    
    if @like.save
      flash[:notice] = "Bookmark Liked!"
    else
      flash[:alert] = "Like not saved... ERROR!"
    end
    redirect_to(request.referrer || @bookmark.topic)
  end
  
  def destroy
    @like = current_user.likes.find(params[:id])
    
    authorize @like
    
    if @like.destroy
      flash[:notice] = "Bookmark Unliked!"
    else
      flash[:alert] = "Bookmark still Liked... ERROR!!"
    end
    redirect_to(request.referrer || @bookmark.topic)
  end
  
  private
  
  def get_bookmark
    @bookmark = Bookmark.find(params[:bookmark_id])
  end
end
