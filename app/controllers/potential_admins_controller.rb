class PotentialAdminsController < ApplicationController  
  def new
    potential_admin = PotentialAdmin.new(params[:potential])
    
  end

  def create
    potential_admin = PotentialAdmin.new(email: params[:potential_admin][:email]) #pull in the email address from the form here
   

      if potential_admin.save
          UserMailer.admin_confirmation(potential_admin).deliver
      end

      redirect_to users_path

        # WRITE THE CODE to redirect the user to the users' index

    # @admin = Admin.new(params[:user])

    # respond_to do |format|
    #   if @admin.save
    #     format.html { redirect_to @user, notice: 'admin was successfully created.' }
    #     format.json { render json: @user, status: :created, location: @user }
    #   else
    #     format.html { render action: "new" }
    #     format.json { render json: @user.errors, status: :unprocessable_entity }
    #   end
    # end
    
  end
end