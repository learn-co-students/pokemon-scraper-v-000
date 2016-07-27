class Pokemon

	attr_accessor :id, :name, :type, :db
	@@all = []

	def initialize(id, name, type, db)
		@@all << self
	end

	def self.all
		@@all
	end

	def self.save(name, type, db)
		db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
	end

	def self.find(id, db)
		db.execute("SELECT id, name, type FROM pokemon WHERE id = #{id}")
	end

	# def execute_create_hp_column
	# 	self.execute("ALTER TABLE pokemon ADD COLUMN hp INTEGER")
	# end


end

# rspec spec/pokemon_spec.rb
