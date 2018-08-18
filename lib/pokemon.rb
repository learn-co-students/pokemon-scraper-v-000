class Pokemon
	attr_accessor :id, :name, :type, :hp, :db 

	def initialize(id:, name:, type:, hp: nil, db:) 
		@id = id
		@name = name 
		@type = type 
		@hp = hp
		@db = db 
	end

	def self.save(name, type, db) 
		db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type) 
	end 

	def self.find(id, db)
		pokemon_deets = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
		Pokemon.new(id: pokemon_deets[0], name: pokemon_deets[1], type: pokemon_deets[2], hp: pokemon_deets[3], db: db)
	end 

	def alter_hp(hp, db) 
		db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, self.id)
	end

end
