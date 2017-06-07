class Pokemon
	attr_accessor :name, :type, :db, :id, :hp

	@@all = []

	def initialize(id:, name:, type:, db:, hp: nil)
		@id = id
		@name = name
		@type = type
		@db = db
		@hp = hp
	end

	def self.save(name, type, db)
		db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
	end

	def self.find(id, db)
		pokemon_by_id = (db.execute("SELECT * FROM pokemon WHERE pokemon.id = ?", id)).flatten
		self.new(id: pokemon_by_id[0], name: pokemon_by_id[1], type: pokemon_by_id[2], db: db, hp: pokemon_by_id[3])
	end

	
end
