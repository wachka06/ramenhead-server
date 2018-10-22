class AuthController < ApplicationController

  def login
    @user = User.find_by(email: params[:email]) #find_by always take key value pair!
    if @user && @user.authenticate(params[:password])
      render json: @user, status :accepted
    else
      render json: { error: 'Wrong username or password', status: :unauthorized }
    end
  end

  # def relogin
  #
  # end

  private
  def user_params
    params.require(:user).permit(:name, :password, :email)
  end
end
