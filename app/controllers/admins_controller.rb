class AdminsController < ApplicationController
  def new
    @admin = Admin.new
    @generated_number = params[:generated_number]
  end

  def create
    generated_number = params[:admin][:generated_number].to_s

    admin = Admin.new(
      name: params[:admin][:name],
      email: params[:admin][:email],
      password: params[:admin][:password],
      password_confirmation: params[:admin][:password_confirmation]
    )

    user_generated_number = params[:admin][:generated_number]
    user_email = admin.email

    padmin = PotentialAdmin.find_by_email(user_email)
    if padmin && admin.save && padmin.generated_number == user_generated_number
      PotentialAdmin.find_by_email(user_email).destroy
      redirect_to signin_path
    else
      redirect_to admin_new_path(generated_number: generated_number)
    end

  end



end