class Member::CommentsController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    content = current_user.comments.new(comment_params)
    content.post_id = post.id
    content.save
    redirect_to post_path(post)
  end

  def show
    @posts = current_user
    @post = Post.find(params[:post_id])
    @comment = Comment.find(params[:id])
  end

  def destroy
      @post = Post.find(params[:post_id])
      comment = @post.comments.find(params[:id])
      if current_user.id == comment.user.id
        comment.destroy
        redirect_to post_path(@post.id)
      else
        render "records/show"
      end
  end


  private

  def comment_params
    params.require(:comment).permit(:content)
  end

end
