require 'pry'

class Pokemon
	attr_accessor :id, :name, :type, :db

	@@all = []

	def initialize(id:, name:, type:, db:)
		@id = id
		@name = name
		@type = type 
		@db = db 
	end

	def self.all 
		@@all 
	end

	def self.save(name, type, db)
		db.execute("INSERT INTO pokemon (name, type) VALUES ( ?, ? )", name, type)
	end 

	def self.find(id, db)
		pokemon_instance = db.execute("SELECT name, type FROM pokemon WHERE id = ( ? )", id)
		self.new(id: id, name: pokemon_instance[0][0], type: pokemon_instance[0][1], db: db)
	end
end