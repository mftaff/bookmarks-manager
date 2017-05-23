class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  
  include Pundit
  
  protect_from_forgery with: :exception
  
  before_action :authenticate_user!
  
  rescue_from Pundit::NotAuthorizedError, with: :action_not_authorized
  
  def log_info *args
      args.each { |arg| Rails.logger.info ">>>>>>> #{arg}" }
  end
  helper_method :log_info
  
  private
  
  def action_not_authorized(exception)
    policy_name = exception.policy.class.to_s.underscore
    
    flash[:alert] = t "#{policy_name}.#{exception.query}", scope: "pundit", default: :default
    redirect_to(request.referrer || root_path)
 end
end
