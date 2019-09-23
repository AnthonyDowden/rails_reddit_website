class Community < ApplicationRecord
	extend FriendlyId
	friendly_id :name, use: :slugged
	has_many :posts
	belongs_to :user
end
