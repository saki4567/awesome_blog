class User < ApplicationRecord
	has_many :microposts
	
	validates :name, presence: true

	EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

	validates :email, presence: true,
										format: { with: EMAIL_REGEX },
										uniqueness: true
	has_secure_password

	def followers
		Relationship.where(followed_id: id)
	end

	def following
		Relationship.where(follower_id: id)
	end

	def relationship(other_user)
		Relationship.find_by(
			follower_id: id,
			followed_id: other_user.id
		)
	end

	def feed
		ids = following.pluck(:followed_id)
		ids << id
		
		Micropost.where(user_id: ids)
	end
end