require 'pry'
class Pokemon

	@@all = []

	attr_accessor :id, :name, :type, :db

	def initialize(id=nil,name, type, db)
		@name = name
		@type = type
		@db = db
		@id=id
		@@all << self
	end

	def self.save(name, type, db)
		db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
		@id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
	end

	def self.find(id, db)
		db.execute("SELECT id, name, type FROM pokemon")[0]
	end
end
