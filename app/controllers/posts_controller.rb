class PostsController < ApplicationController
 before_action :authenticate_user!, only: [:new, :create]
  def new 
    @post = current_user.posts.new()
  end
  def index
    # all members
    @posts = Post.all
  end
  def create
    @post = current_user.posts.new(post_params)
    if @post.save
      redirect_to posts_path
    else 
      render 'new'
    end
    
  end
  
  private
  
  def post_params
    params.require(:post).permit(:title, :body)
  end
end
