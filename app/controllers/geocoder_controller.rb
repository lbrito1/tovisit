class GeocoderController < ApplicationController

	def decode
		addr = Geocoder.search([params['latitude'],params['longitude']]).first
		if addr.city.nil?			
			respond_to do |format|
			  format.json { render json: 'No city found', status: 400 }
			end
		else
			respond_to do |format|
			  format.json { render json: { city: addr.city } }
			end
		end
	end

end
