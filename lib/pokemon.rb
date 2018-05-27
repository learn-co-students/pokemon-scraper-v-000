class Pokemon
attr_accessor :id, :name, :type, :db

	def initialize(name:, type:, db:, id: nil)
		@id = id
		@name = name
		@type = type
		@db = db
	end

	def self.save(name, type, db)
		db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
    end

	def self.find(id_number, db)
		pokemon_database = (db.execute("SELECT * FROM pokemon WHERE id = (?)", id_number)).flatten
		new_pokemon = Pokemon.new(id: pokemon_database[0], name: pokemon_database[1], type: pokemon_database[2], db: db)
		new_pokemon
		#binding.pry
	end
end
