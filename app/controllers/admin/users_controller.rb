class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end
  
  
  
  
  private
  
end
