class Pokemon
	attr_reader :name, :type, :db
	def initialize(num, name, type, db)
		@name = name
		@type = type
		@db = db
	end
	
	def self.save(name, type, db)
		db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
	end
	
	def self.find(key, db)
		db.execute("SELECT id, name, type FROM pokemon WHERE id = ?", key).flatten
	end
end
