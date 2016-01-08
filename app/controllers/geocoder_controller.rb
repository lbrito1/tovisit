class GeocoderController < ApplicationController

	def decode
		addr = Geocoder.search([params['latitude'],params['longitude']]).first
		respond_to do |format|
		  format.json { render json: { city: addr.city } }
		end
	end

end
