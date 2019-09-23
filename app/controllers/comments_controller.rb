class CommentsController < ApplicationController
	before_action :get_community
	before_action :get_post
	before_action :set_post, only: :create
	def index
		@comments = Comment.all
	end

	def show
		@comments = Comment.find(params[:id])
	end


	def new
		@comment = Comment.new(post_id: params[:post_id])
	end


	def create
		@comment = @post.comments.build(comment_params)
		@comment.user = current_user
		if @comment.save
			redirect_to community_post_path(@community, @post), notice: 'Comment was successfully created.'
		else
			render community_post_path(@community, @post), notice: 'Comment was not created.'
		end
	end

	private

	def get_community
		@community = Community.friendly.find(params[:community_id])
	end
	def get_post
		@post = Post.friendly.find(params[:post_id])
	end

	def comment_params
		params.require(:comment).permit(:content)
	end

	def set_post
		@post = Post.friendly.find params[:post_id]
	end
end
