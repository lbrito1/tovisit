class Place
	include Mongoid::Document

	embedded_in :user

	field :name, type: String
	field :coordinates, type: Array
	field :visited, type: Boolean, default: false

 	validates_uniqueness_of :name
end