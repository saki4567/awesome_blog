class StaticPagesController < ApplicationController
  def home
  	if current_user
  		@micropost = Micropost.new
  		@microposts = current_user.feed
  		render "users/feed"
  	end
  end

  def about
  end
end
