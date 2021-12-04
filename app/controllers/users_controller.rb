class UsersController < ApplicationController
  #SHOW
  def show
    @user = User.find(params[:id])
  end
end
