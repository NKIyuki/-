class Member::CommentsController < ApplicationController

  def create
    post = Post.find(params[:post_id])
    content = current_user.comments.new(comment_params)
    content.post_id = post.id
    content.save
    redirect_to post_path(post)
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

end
