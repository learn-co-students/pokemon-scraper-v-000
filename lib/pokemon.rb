class Pokemon
	attr_accessor :number, :name, :type, :db
	def initialize(number, name, type, db)
		@number = number
		@name = name
		@type = type
		@db = db
	end

	def self.save(name, type, db)
		db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)",name, type)
	end

	def self.find(id, database)
		database.execute("SELECT * FROM pokemon WHERE id = (?)", id)[0]
	end

end
