class Admin::CommentsController < ApplicationController

  def index
    @comments = Comment.finf(params[:id])
  end


  def destroy
      @post = Post.find(params[:post_id])
      comment = @post.comments.find(params[:id])
      comment.destroy
      redirect_to admin_post_path(@post)

  end

private

end
