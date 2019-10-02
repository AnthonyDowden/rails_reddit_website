class PostPolicy < ApplicationPolicy
	attr_reader :user, :post

	def initialize(user, post)
		@user = user
		@post = post
	end

	def update?
		user.admin? or not post.published?
	end

	def admin?
		false
	end

	def create?
		false
	end

	def published?
		@post = Post.find(params[:id])
		authorize @post, :update?
		@post.publish!
		redirect_to @post
	end
end