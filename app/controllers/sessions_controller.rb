class SessionsController < ApplicationController
	def new
	end


	def create
		user = User.find_by_email(params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			session[:remember_token] = user.id
			redirect_to user
		else
			flash[:error] = 'Invalid email/password combination'
			render 'new'
		end
	end

	def destroy
		# this is incorrect and will not delete session properly
		# session[:remember_token] = nil

		session.delete(current_user.id)

		redirect_to root_path
	end
end
