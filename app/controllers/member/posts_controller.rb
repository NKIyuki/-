class Member::PostsController < ApplicationController
  def new
    @posts = Post.new
  end

  def index
  end

  def show
  end

  def edit
  end

  def create
    post = Post.new(post_params)
    post.save
    redirect_to 'post_path'
  end

  private

  def post_params
    params.require(:post).permit(:title,:content)
  end


end
