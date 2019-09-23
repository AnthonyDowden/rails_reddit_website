class User < ApplicationRecord
  acts_as_voter
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one :profile
  has_many :posts
  has_many :comments
  has_many :communities

  after_create :create_profile

  def create_profile
    Profile.create(user_id:self.id)
  end
end
