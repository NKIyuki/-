class Member::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    @comment = Comment.new
  end

  def edit
    @post = Post.find(params[:id])
      unless @post.user == current_user
        redirect_to  new_post_path
      end
  end

  def create
    post = Post.new(post_params)
    post.user_id = current_user.id
    post.save
    redirect_to post_path(post)
  end

  def update
    post = Post.find(params[:id])
    post.update(post_params)
    redirect_to post_path(post.id)
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  def search
  	@posts = Post.where('title LIKE(?)', "%#{params[:search]}%").order(created_at: :desc)
  	@search_result = "#{params[:search]}"
  	render :index
  end


  private

  def post_params
    params.require(:post).permit(:title,:content,images: [])
  end


end
