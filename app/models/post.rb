class Post < ApplicationRecord
  acts_as_votable
  extend FriendlyId
  friendly_id :title, use: :slugged
  belongs_to :community
  belongs_to :user
  has_many :comments
end
