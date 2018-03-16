class Pokemon

	@@all = []

	attr_accessor :id, :name, :type, :db, :hp

	def self.all
		@@all
	end


	def initialize(attributes)
		attributes.each {|key, value| self.send(("#{key}="), value)}
		self.class.all << self
	end

	def self.save(name, type, db)
		 db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
	end

	def self.find(id, db)
		pokemon = db.execute("SELECT * from pokemon WHERE id = #{id}")
		pokemon_attr_hash = {}
		pokemon_attr_hash[:id] = pokemon[0][0]
		pokemon_attr_hash[:name] = pokemon[0][1]
		pokemon_attr_hash[:type] = pokemon[0][2]
		pokemon_attr_hash[:hp] = pokemon[0][3]
		new_pokemon = self.new(pokemon_attr_hash)
	end

	def alter_hp
		
	end


end
