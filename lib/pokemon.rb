require 'pry'
class Pokemon
	attr_accessor :id, :name, :type, :hp, :db

	def initialize(id:, name:, type:, hp:nil, db:)
		@id = id
		@name = name
		@type = type
		@hp = hp
		@db = db
	end

	def self.save(name, type, db)
		# binding.pry
		db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
	end

	def self.find(id, db)
		# binding.pry
		pokemon_info = db.execute("SELECT * FROM pokemon WHERE id=?", id).flatten
	  Pokemon.new(id: pokemon_info[0], name: pokemon_info[1], type: pokemon_info[2], hp: pokemon_info[3], db: db)
		# binding.pry
	end

	def alter_hp(hp_level, db)
		db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp_level, self.id)
	end
end
