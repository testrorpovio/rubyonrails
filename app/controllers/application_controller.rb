class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?, :featured_post
  
  def featured_post
    @featured_post = Post.order("RANDOM()").first
  end
  
  def current_user
    @current_user ||= User.find( session[:user_id] ) if session[:user_id]
  end
  
  
  def logged_in?
    !!current_user
  end
  
  def require_user
    if !logged_in?
      flash[:danger] = "You have to be logged in in order to do this."
      redirect_to root_path
    end
  end
  
  
end
