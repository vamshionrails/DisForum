class ApplicationController < ActionController::Base
  protect_from_forgery
  helper :all
  
  def find_user
    @user = User.find(session[:user_id])
  end
    
  protected
  
  def login_required
    unless User.find_by_id(session[:user_id])
      flash[:notice] = "Please login"
      redirect_to login_path
    end
  end
end
