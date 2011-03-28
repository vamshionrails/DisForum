class ForumsController < ApplicationController
  respond_to :html, :xml
  before_filter :find_forum, :except => [:index, :new, :create]
  before_filter :login_required, :except => [:index, :show, ]
  
  def index
    @forums = Forum.all.paginate :per_page => 10, :page => params[:page], :order => 'created_at DESC'
    respond_with @forums
  end
  
  def new
    @forum = Forum.new
    respond_with @forum
  end
  
  def show
    @posts = @forum.posts.paginate :page => params[:page], :per_page => 10, :order => "created_at DESC"
    respond_with @forum
  end
  
  def create
    @forum = Forum.new(params[:forum])
    flash[:notice] = "forum successfully created..." if @forum.save
    respond_with @forum
  end
  
  def edit
    respond_with @forum
  end
  
  def update
    flash[:notice] = "forum successfully updated..." if @forum.update_attributes(params[:post])
    respond_with @forum
  end
  
  def destroy
    @forum.destroy
    respond_with @forum
  end
  
  protected
  
  def find_forum
    @forum = Forum.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to :action => 'index'
  end
end
