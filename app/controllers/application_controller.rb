class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :authenticate_user!
  
  def log_info *args
      args.each { |arg| Rails.logger.info ">>>>>>> #{arg}" }
  end
  helper_method :log_info
end
