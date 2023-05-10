class Member::HomesController < ApplicationController

  def top
    @posts = Post.all
  end

end
