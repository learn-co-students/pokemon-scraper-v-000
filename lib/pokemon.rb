class Pokemon
	attr_accessor :id, :name, :type, :db
	attr_reader :row_idx

	def self.save(name, type, db)
		db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
	end

	def initialize (name = nil, type = nil, db = nil, id = nil)
		self.name = name
		self.type = type
		self.db = db
		self.id = row_idx_add
	end

private
	def row_idx_add
		if row_idx == nil
			@row_idx = 1
		else
			@row_idx += 1
		end

		row_idx
	end
end
