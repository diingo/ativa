class AdminsController < ApplicationController
  def new
    @admin = Admin.new
  end

  def create

    admin = Admin.new(
      name: params[:admin][:name],
      email: params[:admin][:email],
      password: params[:admin][:password],
      password_confirmation: params[:admin][:password_confirmation]
    )

    #if it works, let them sign in and if not, let them try again
    if admin.save
      redirect_to sign_in_path
    else
      redirect_to admin_new_path
    end

  end
end