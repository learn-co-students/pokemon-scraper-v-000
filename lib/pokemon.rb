class Pokemon
	attr_accessor :name, :type, :db, :id, :hp

	

	def initialize (id, name = nil, type = nil, db = nil, hp = nil)
		@@all = []
		@id = id
		@name = name
		@type = type
		@db = db
		@hp = hp
		@@all << self
	end

	def self.all
		@@all
	end

	def self.save (name, type, database_connection)
		database_connection.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)" ,name, type)
	end

	def self.find (id, database_connection)
		pokemon_object = database_connection.execute("SELECT * FROM pokemon WHERE id = #{id}")
		name = pokemon_object[0][1]
		type = pokemon_object[0][2]
		hp = pokemon_object[0][3]
		db = database_connection
		self.new(id, name, type, db, hp)
		#binding.pry
	end

	def alter_hp (hp, database_connection)
		database_connection.execute("UPDATE pokemon SET hp = #{hp} WHERE #{self.id}")
	end
end

	
