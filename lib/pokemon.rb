class Pokemon

	attr_accessor :name, :type, :db, :id, :hp

	def initialize(name, type, id, db)
		@name = name
		@type = type
		@db = db
		@id = id
		@hp = hp
	end

	def self.save(name, type, db)
		db.execute("INSERT INTO pokemon(name, type) VALUES (?, ?)", name, type)
	end

	def self.find(id, db)
		db.execute("SELECT * FROM pokemon WHERE id = ?", id)
	end

	def alter_hp(adjusted_hp)
		db.execute("UPDATE pokemon SET hp = ? WHERE ID = ?", adjusted_hp, id)
	end
end
