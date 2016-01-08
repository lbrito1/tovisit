class PlacesController < ApplicationController

	def index
	end

	def show
	end

	def create
		place = Place.new(coordinates: [params['latitude'],params['longitude']])
		current_user.places << place
		current_user.save!
		respond_to do |format|
		  format.json { head :ok }
		end
	end

	def destroy
	end
end
