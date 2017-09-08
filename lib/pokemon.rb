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
		db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
	end

	def self.find(id_num, db)
		pokemon_data = db.execute("SELECT * FROM pokemon WHERE id=?", id_num).flatten
		Pokemon.new(id: pokemon_data[0], name: pokemon_data[1], type: pokemon_data[2], db: db)
		# binding.pry
	end
end
