class Pokemon
	attr_accessor :id, :name, :type, :db
	
	@@all = []
	@@row_idx = 0
	
	def self.row_idx
		@@row_idx
	end

	def self.save(name, type, db)
		db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
		@@all << self
	end

	def self.find(id, db)
		arr = db.execute("SELECT name, type, id FROM pokemon WHERE id IN (?)", id)
		poke = Pokemon.new(arr[0][0], arr[0][1], db, arr[0][2])
		poke
	end

	def initialize (name = nil, type = nil, db = nil, id = nil)
		self.name = name
		self.type = type
		self.db = db
		self.id = (!id ? id : self.class.row_idx_add)
	end

private
	def self.row_idx_add
		@@row_idx += 1
		@@row_idx
	end
end
