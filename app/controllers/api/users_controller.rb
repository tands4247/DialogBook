class Api::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    ary = [@user]
    ary.push(@user.posts)
    render json: ary
  end
end