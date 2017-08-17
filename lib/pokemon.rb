class Pokemon
	attr_accessor :name, :type, :db, :id

	@@all = []

	def initialize(id: id, name: name, type: type, db: db)
		@name = name
		@type = type
		@db = db
		@id = id
	end

	def self.save(name, type, db)
		db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?);", name, type)
	end

	def self.all
		@@all 
	end

	def self.find(id, db)
		info = db.execute("SELECT * FROM pokemon WHERE id=?", id).flatten
    		Pokemon.new(id: info[0], name: info[1], type: info[2], db: db)
	end
end
