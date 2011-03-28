class PostsController < ApplicationController
  respond_to :html, :xml
  before_filter :find_forum, :except => [:edit, :show, :feed, :destroy]
  before_filter :find_post, :except => [:index, :new, :create, :feed]
  before_filter :login_required, :except => [:show, :index, :feed]
  
  def index
    redirect_to(forum_path(@forum))
  end
  
  def new
    @post = @forum.posts.build
  end
  
  def create
    @post = @forum.posts.build(params[:post])
    @user = User.find(session[:user_id])
    @post.user = @user
    if @post.save
      redirect_to(forum_posts_path(@forum))
    else
      render :action => "new"
    end
  end
  
  def edit
    @forum = @post.forum
  end
  
  def show
    @forum = @post.forum
  end
  
  def update
    if @post.update_attributes(params[:post])
      flash[:notice] = "Post was successfully updated..."
      redirect_to(forum_posts_path(@forum))
    else
      render :action => "edit"
    end
  end
  
  def destroy
    @post.destroy
    
    redirect_to :controller => "admin", :action => "index"
  end
  
  def feed
    @posts = Post.limit(10).order("id DESC")
    respond_to do |format|
      format.xml { render :layout => false }
    end
  end
  
  protected
  
  def find_forum
    @forum = Forum.find(params[:forum_id])
  end
  
  def find_post
    @post = Post.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to :controller => "forums", :action => 'index'
  end
end
