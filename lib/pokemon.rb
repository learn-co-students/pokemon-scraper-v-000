require 'pry'
class Pokemon

	attr_accessor :id, :name, :type, :db, :hp

	def initialize(id:, name:, type:, db:, hp: nil)
		@id = id
		@name = name
		@type = type
		@db = db
		@hp = hp
	end

	def self.save(name, type, db)
		db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
	end

	def self.find(id, db)
		found = db.execute("SELECT * FROM pokemon WHERE id = ?",id).flatten
		Pokemon.new(id:id, name:found[1], type:found[2], db:db, hp:found[3])
	end

	def alter_hp(hp,db)
		db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, self.id)
	end

end
