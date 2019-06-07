class UsersController < ApplicationController

  #skip_before_action :authenticate_request, only: ['check']

  def create
    @user = User.new
    @user.name=params[:name]
    @user.password=params[:password]
    @user.carte=params[:carte]
    @user.save
  end


  def check
      ##@current_user = User.where(name: params[:name], password_digest: params[:password_digest]).first
      ##puts @current_user
      @current_user=User.find(1)
      if @current_user
        session[:user]=@current_user
        flash[:info] = "Bienvenue #{@current_user.name} !"
        redirect_to "/articles"
      else
        flash[:info] = "Échec de la connexion"
        redirect_to "/users/login"
      end
  end

  def logout
    session.clear
    redirect_to "user/login"
  end


  private

  def user_params
    params.permit(:name, :password)
  end

end


