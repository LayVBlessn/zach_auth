class SessionsController < ApplicationController
  before_action :require_no_authentication, only: %i[new create]
  before_action :require_authentication, only: :destroy

  def new
  end

  def create
    user = User.find_by login: params[:login]
    if user&.authenticate(params[:password])
      sign_in(user)
      redirect_to '/urls'
    else
      redirect_to new_session_path
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end


end
