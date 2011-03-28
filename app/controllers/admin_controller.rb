class AdminController < ApplicationController
  before_filter :check, :only => [:index]
  
  def index
    @posts = Post.all.paginate :page => params[:page], :per_page => 10
  end
  
  def login
    if request.post?
      user = User.authenticate(params[:name], params[:password])
      if user && user.isadmin
        session[:user_id] = user.id
        session[:name] = params[:name]
        redirect_to :action => "index"
      else
        flash.now[:notice] = "Invalid user/password"
      end
    end
  end
  
  def check
    user = User.find_by_id_and_isadmin(session[:user_id], true)
    unless user
      flash[:notice] = "Please login"
      session[:user_id] = nil
      session[:name] = nil
      redirect_to :controller => "admin", :action => "login"    
    end
  end
end
