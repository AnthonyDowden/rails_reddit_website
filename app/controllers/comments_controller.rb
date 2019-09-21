class CommentsController < ApplicationController
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
		@comment = @post.comments.new(comment_params)
		if @comment.save
			redirect_to post_path @post, notice: 'Comment was successfully created.'
		else
			render 'posts/show'
		end
	end

	private

	def comment_params
		params.require(:comment).permit(:post_id,:content)
	end

	def set_post
		@post = Post.find params[:post_id]
	end
end
