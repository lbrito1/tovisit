class Place
	include Mongoid::Document
	include Geocoder::Model::Mongoid

	embedded_in :user

	field :coordinates, :type => Array
	field :address
	field :visited, type: Boolean, default: false

	reverse_geocoded_by :coordinates
	after_validation :reverse_geocode  # auto-fetch address

end