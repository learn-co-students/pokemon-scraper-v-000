class Pokemon
	attr_accessor :id, :name, :type, :db

	@@all = []

	def initialize(id: nil, name: name, type: type, db: db)
		@id = id
		@name = name
		@type = type
		@db = db
		self.class.save(name, type, db)
	end

	def self.save(name, type, db)
    	db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
    	@id = db.execute("SELECT last_insert_rowid() FROM pokemon")
    	@@all << self
  	end

  	def self.find(id, db)
  		found_pokemon = db.execute("SELECT * FROM pokemon WHERE pokemon.id = id")
  		new_pokemon = Pokemon.new(name: "", type: "", db: db)
  		found_pokemon.each do |found_pokemon|
  			new_pokemon.id = found_pokemon[0]
  			new_pokemon.name = found_pokemon[1]
  			new_pokemon.type = found_pokemon[2]
  		end
  		new_pokemon
  	end
end
