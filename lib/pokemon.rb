class Pokemon

	attr_accessor :id, :name, :type, :db, :hp

	def initialize(id, name, type, db)
		@db = db
	end

	def self.all
		@@all
	end

	def self.save(name, type, db)
		db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
	end

	def self.find(id, db)
		db.execute("SELECT * FROM pokemon WHERE id = #{id}")
		# Pokemon.new(info, db)
	end

	def alter_hp(new_hp)
		db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, id)
	end


end

# rspec spec/pokemon_spec.rb
