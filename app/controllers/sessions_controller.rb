class SessionsController < ApplicationController
	def new
	end

	def create
		user = User.find_by(email: params[:session][:email])

		if user && user.authenticate(params[:session][:password])
			session[:user_id] = user.id
			flash[:notice] = "Hurray! Sucessfully logged in!"
			redirect_to user_url(user)
		else
			flash[:notice] = "Invalid information."
			render "new"
		end
	end

	def destroy
		session.delete(:user_id)

		redirect_to root_url
	end
end
