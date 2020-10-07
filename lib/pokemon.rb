require 'pry'

class Pokemon

	attr_accessor :id, :name, :type, :db

	def initialize(id:, name:, type:, db:)
		@id = id
		@name = name
		@type = type
		@db = db
	end

	def self.save(name, type, db)
		db.execute("INSERT INTO pokemon (name, type) VALUES ( ?, ? )", name, type)
	end

	def self.find(id, db)
		# .find
  		#   finds a pokemon from the database by their id number and returns a new Pokemon object (FAILED - 1)
  		pokemon_info = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
  		# [1, "Pikachu", "electric"]
  		Pokemon.new(id: pokemon_info[0], name: pokemon_info[1], type: pokemon_info[2], db: db)
	end
end

