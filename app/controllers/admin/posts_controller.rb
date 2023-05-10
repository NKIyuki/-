class Admin::PostsController < ApplicationController
  def index
    @posts = Post.all
    @commtnts = Comments.all
  end
  
  
  
  
  private
  
end
