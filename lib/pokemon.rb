class Pokemon
	attr_accessor :id, :name, :type, :db, :hp
	
	@@all = []
	@@row_idx = 0
	
	def self.row_idx
		@@row_idx
	end

	def self.save(name, type, db, hp = 60)
		db.execute("INSERT INTO pokemon (name, type, hp) VALUES (?, ?, ?)", name, type, hp)
		@@all << self
	end

	def self.find(id, db)
		arr = db.execute("SELECT name, type, id, hp FROM pokemon WHERE id IN (?)", id)
		poke = Pokemon.new(arr[0][0], arr[0][1], db, arr[0][2], arr[0][3])
		poke
	end

	def initialize (name = nil, type = nil, db = nil, id = nil, hp = 60)
		self.name = name
		self.type = type
		self.db = db
		self.id = (!!id ? id : self.class.row_idx_add)
		self.hp = hp
	end
	
	def alter_hp(hp, db)
		db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, self.id)
		self.hp = hp
		puts "ID: " + self.id.to_s + " HP: " + hp.to_s + "."
	end
	
private
	def self.row_idx_add
		@@row_idx += 1
		@@row_idx
	end
end
