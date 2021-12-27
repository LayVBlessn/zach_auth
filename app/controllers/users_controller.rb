class UsersController < ApplicationController
  before_action :require_no_authentication, only: %i[new create]
  before_action :require_authentication, only: %i[update edit]
  before_action :set_user!, only: %i[update edit]
  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new user_params
    if User.find_by(login: @user.login) == nil
      if @user.save
        sign_in(@user)
        redirect_to '/urls'
      else
        render :new
      end
    else
      render :new
    end
  end

  def update
    if !@user.update(login: params[:new_login])
      redirect_to '/update'
    else
      redirect_to 'vk.com'
    end
  end

  private 

  def set_user!
    @user = User.find_by(login: current_user.login)
  end

  def user_params 
    params.require(:user).permit(:login, :password, :password_confirmation)
  end

end
