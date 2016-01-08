class Place
	include Mongoid::Document

	embedded_in :user

	field :name, type: String
	field :coordinates, type: Array
	field :visited, type: Boolean, default: false

 	validates_uniqueness_of :name

 	def visit
 		update_attributes(visited: !self.visited)
 	end
end