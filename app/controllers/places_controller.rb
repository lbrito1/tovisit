require 'will_paginate/array'

class PlacesController < ApplicationController

	def visit
		(current_user.find_place params['place_id']).visit
		respond_to do |format|
		  format.json { head :ok }
		  format.html { redirect_to user_places_path(current_user) }
		end
	end

	def index
		@places = current_user.places
		@paginated_places = @places.paginate(page: params[:page], per_page: 10)
		respond_to do |format|
			format.json { render json: @places.to_json }
			format.html
		end
	end

	def create
		query = params['name'] # Textual input
		query ||= [params['latitude'],params['longitude']] # Map input

		addr = Geocoder.search(query).first 

		place = Place.new(coordinates: [addr.latitude,addr.longitude], 
			user: current_user, name: addr.city)
		place.save! if place.valid?

		respond_to do |format|
		  format.json { head :ok }
		end
	end

	def destroy
		if (current_user.find_place params['id']).delete
			respond_to do |format|
		  	format.json { head :ok }
		  	format.html { redirect_to user_places_path(current_user) }
			end
		else
			respond_to do |format|
				format.json { render json: "Place not found", status: 404 }
			end
		end
	end
end
