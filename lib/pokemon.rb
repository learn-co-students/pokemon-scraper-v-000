class Pokemon
	attr_accessor :name, :type, :db 

	@@all = []

	def initialize(id = nil, name, type, db)
		@name = name
		@type = type
		@db = db
		@@all << self
	end

	def self.save(name, type, db)
		db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
	end

	def self.find(id, db)
		db.execute("SELECT * FROM pokemon WHERE id = ?", id ).flatten
	end


	def self.all
		@@all
	end
end

