class UsersController < ApplicationController
  def new

  end

  def show
    @user = GithubUser.new(current_user)
    @reg_user = current_user
  end
end
