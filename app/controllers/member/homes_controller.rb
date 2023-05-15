class Member::HomesController < ApplicationController

  def top
    @posts = Post.all.order('id DESC').limit(4)
  end

end
