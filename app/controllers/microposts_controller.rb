class MicropostsController < ApplicationController
	def create
		@micropost = Micropost.new(
			content: params[:micropost][:content],
			user: current_user,
			picture: params[:micropost][:picture]
		)

		if @micropost.save
			redirect_to root_url
		else
			@microposts = Micropost.all
			render "users/feed"
		end
	end

end