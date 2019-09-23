class CommunitiesController < ApplicationController
	before_action :set_community, only: [:show, :edit, :destroy]
	def index
		@communities = Community.all
	end

	def show
		@community = Community.friendly.find(params[:id])
	end

	def new
		@community = Community.new
	end

	def create
		@community = Community.new(community_params)
		if @community.save
			redirect_to communities_path, notice:"#{@community.name} was successfully created."
		else
			render :new
		end
	end

	def edit

	end

	def update
		if @community.update(community_params)
			redirect_to community_path(@community), notice: "#{@community.name} was successfully updated."
		else
			render :edit
		end
	end



	private

	def community_params
		params.require(:community).permit(:name, :description)
	end

	def set_community
		@community = Community.friendly.find(params[:id])
	end

end
