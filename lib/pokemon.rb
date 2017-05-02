class Pokemon
	attr_accessor :name, :type, :db, :id, :hp
		
	def initialize (arguments)
		arguments.each do |key, value| 
			self.send("#{key}=", value)
		end
	end

	def self.save(name, type, database)
		database.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
	end

	def self.find(number, db)	
		pokemon_array = db.execute("SELECT * FROM pokemon WHERE id = #{number}").flatten
		new_pokemon = Pokemon.new(id: pokemon_array[0], name: pokemon_array[1], type: pokemon_array[2], db: db)
		new_pokemon
	end	

end
