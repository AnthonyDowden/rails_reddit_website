class CommunitiesController < ApplicationController
	def index
		@communities = Community.all
	end

	def show
		@community = Community.find(params[:id])
	end

	def new
		@community = Community.new
	end

	def create
		@community = Community.new(community_params)
		if @community.save
			redirect_to communities_path, notice:'Community was successfully created.'
		else
			render :new
		end

	end


	private

	def community_params
		params.require(:community).permit(:name, :description)
	end

end
