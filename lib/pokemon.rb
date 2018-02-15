class Pokemon
	attr_accessor :name, :type, :db, :id, :hp

	@@all = []

	def initialize(id:, name:, type:, db:, hp: nil)
		@name = name
		@type = type 
		@db = db
		@hp = hp
		@id = id
		@@all << self
	end

	def self.find(id, db)
		p = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
		p = p.flatten
		Pokemon.new(id: p[0], name: p[1], type: p[2], db: db, hp: p[3])
	end

	def alter_hp(health, db)
		db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", health, self.id)
	end

	def self.all
		@@all 
	end

	def self.save(name, type, db)
		db.execute("INSERT INTO pokemon (name, type) VALUES(?,?)", name, type)
	end


end
