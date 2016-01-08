class PlacesController < ApplicationController

	def visit
		#mark as visited
	end

	def index
		@places = current_user.places #will_paginate
		respond_to do |format|
			format.json { render json: @places.to_json }
			format.html
		end
	end

	def create
		addr = Geocoder.search([params['latitude'],params['longitude']]).first # Refactor this
		place = Place.new(coordinates: [params['latitude'],params['longitude']], 
			user: current_user, name: addr.city)
		place.save! if place.valid?

		respond_to do |format|
		  format.json { head :ok }
		end
	end

	def destroy
		if current_user.places.find_by(name: params['id']).delete
			respond_to do |format|
		  	format.json { head :ok }
			end
		else
			respond_to do |format|
				format.json { render json: "Place not found", status: 404 }
			end
		end
	end
end
