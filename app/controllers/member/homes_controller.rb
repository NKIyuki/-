class Member::HomesController < ApplicationController

  def top
    @posts = Post.all
    @post = Post.order('id DESC').limit(3)
  end

end
