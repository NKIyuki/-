class Admin::CommentsController < ApplicationController
  
  def index
    @comments = Comment.finf(params[:id])
  end
  
private
  
end
