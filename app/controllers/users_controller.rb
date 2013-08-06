class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
	  @user = User.find(params[:id])
  end

  def create
	     @user = Client.new(params[:user])
    if @user.save
      UserMailer.signup_confirmation(@user).deliver
      flash[:success] = "Welcome to my awesome app!"
      redirect_to user_url(@user.id)
    else
      render 'new'
    end
  end

  def index
    @clients = Client.all
    @admins = Admin.all
    @potential = PotentialAdmin.new
    @potentials = PotentialAdmin.all
  end
end