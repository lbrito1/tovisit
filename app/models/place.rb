class Place
	include Mongoid::Document

	embedded_in :user

	field :name, type: String 
	field :latitude, type: Float
	field :longitude, type: Float
	field :visited, type: Boolean, default: false

end