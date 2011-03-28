class CommentsController < ApplicationController
  before_filter :find_post, :only => [:create]
  before_filter :find_user
  
  def create
    @comment = @post.comments.build(params[:comment])
    @comment.user = @user
    
    if @comment.save
      redirect_to(post_path(@post))
    else
      redirect_to(post_path(@post))
    end
  end
  
  def show
    @comment = Comment.find(params[:id])
    @post = @comment.post
  end
  
  protected
  
  def find_post
    @post = Post.find(params[:post_id])
  end
end
