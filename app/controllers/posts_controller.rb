class PostsController < ApplicationController
	before_action :get_community
	before_action :set_post, only: [:show, :edit, :update, :destroy, :like, :unlike]
	before_action :authenticate_user!, only: [:edit, :create, :update, :destroy]
	before_action :check_ownership!, only: [:edit, :update, :destroy]

	def index
		@posts = @community.posts
	end

	# GET /posts/1
	# GET /posts/1.json
	def show
	end

	def like
		@post.liked_by current_user
		redirect_to community_post_path(@community, @post)
	end

	def unlike
		@post.unliked_by current_user
		redirect_to community_post_path(@community, @post)
	end

	# GET /posts/new
	def new
		@post = @community.posts.build
		@posts = Post.all
	end

	# GET /posts/1/edit
	def edit
		@posts = Post.all
	end

	# POST /posts
	# POST /posts.json
	def create

		@post = @community.posts.build(post_params)
		@post.user = current_user

		if @post.save
			redirect_to community_post_path(@community, @post), notice: 'Post was successfully created.'
		else
			render :new
		end
	end

	# PATCH/PUT /posts/1
	# PATCH/PUT /posts/1.json
	def update
		if @post.update(post_params)
			redirect_to community_post_path(@community, @post), notice: 'Post was successfully updated.'
		else
			render :edit
		end
	end

	# DELETE /posts/1
	# DELETE /posts/1.json
	def destroy
		@post.destroy
		respond_to do |format|
			format.html { redirect_to community_posts_url(@community), notice: 'Post was successfully destroyed.' }
		end
	end

	private

	def get_community
		@community = Community.friendly.find(params[:community_id])
	end

	# Use callbacks to share common setup or constraints between actions.
	def set_post
		@post = Post.friendly.find(params[:id])
	end

	# Never trust parameters from the scary internet, only allow the white list through.
	def post_params
		params.require(:post).permit(:title, :content)
	end

	def check_ownership!
		unless @post.user === current_user
			flash[:alert] = "This ain't your post buddy!"
			redirect_back fallback_location: root_path
		end
	end

end
