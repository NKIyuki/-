class Admin::CommentsController < ApplicationController
  def show
    @comments = Comment.find(params[:id])
  end
  
  
  
  
private
  
end
