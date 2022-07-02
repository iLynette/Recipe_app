class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    redirect_to root_path
  end

  def new; end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to root_path, notice: 'User was successfully created'
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def user_params
    params.require(:user).permit(:name)
  end
end
