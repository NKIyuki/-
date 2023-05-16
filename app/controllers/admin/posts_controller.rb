class Admin::PostsController < ApplicationController
  def index
    @posts = Post.all
    @comments = Comment.all
  end

  def show
    @posts = Post.find(params[:id])
    @comments = @posts.comments.all
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to admin_posts_path
  end


  private

  def post_params
    params.require(:post).permit(:title,:content,images: [])
  end

end
