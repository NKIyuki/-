class Member::UsersController < ApplicationController
   before_action :correct_user, only: [:edit]
  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    @avatar = @user.avatar

  end


  def edit

  end
  
  def update
    if @user.update(user_params)
      redirect_to user_path
    else
      render :edit
    end
  end
  

  private

  def user_params
    params.require(:user).permit(:content,:name,:avatar)
  end

end
