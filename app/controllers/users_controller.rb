class UsersController < ApplicationController
  respond_to :html, :xml
  before_filter :login_required, :except => [:new, :create, :login, :logout]
  before_filter :find_user, :only => [:edit, :update, :destroy]
  before_filter :respond_user, :only => [:edit]
  
  def index
    @users = User.order("name")
    respond_with @users
  end

  def show
    redirect_to users_path
  end

  def new
    @user = User.new
    respond_with @user
  end

  def edit
  end

  def create
    @user = User.new(params[:user])
    flash[:notice] = "User was successfully created..." if @user.save
    respond_with @user
  end

  def update
    flash[:notice] = "User was successfully updated..." if @user.update_attributes(params[:user])
    respond_with @user
  end

  def destroy
    @user.destroy
    respond_with @user
  end
  
  def login
    if request.post?
      user = User.authenticate(params[:name], params[:password])
      if user
        session[:user_id] = user.id
        session[:name] = params[:name]
        redirect_to :controller => "forums", :action => "index"
      else
        flash.now[:notice] = "Invalid user/password"
      end
    end
  end

  def logout
    session[:user_id] = nil
    redirect_to :controller => "forums", :action => "index"
  end
  
  protected
  
  def find_user
    @user = User.find(params[:id])
  end
  
  def respond_user
    respond_with @user
  end
end
