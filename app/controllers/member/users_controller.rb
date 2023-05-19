class Member::UsersController < ApplicationController
   #before_action :correct_user, only: [:edit]
  def new_guest
    user = User.guest
    sign_in user  
    redirect_to root_path, notice: 'ゲストユーザーとしてログインしました。'
  end
   
  def show
    @user = User.find(params[:id])
    @posts = @user.posts
    @avatar = @user.avatar
  end

  def edit
    @user = User.find(params[:id])
  end

  def confirm
    @user = User.all
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to user_path
    else
      render :edit
    end
  end

  def withdrawal
    @user = current_user
    @user.destroy
    redirect_to root_path
  end


  private

  def user_params
    params.require(:user).permit(:content,:name,:avatar)
  end

end
