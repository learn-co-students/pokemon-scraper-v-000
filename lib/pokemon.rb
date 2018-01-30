class Pokemon

	attr_accessor :id, :name, :type, :hp, :db

	def initialize(args)
		@id = args[:id]
		@name = args[:name]
		@type = args[:type]
		@hp = args[:hp] 
		@db = args[:db]
	end

	def self.save(name, type, db)
		db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", [name, type])
	end

	def self.find(id, db)
		result = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
		self.new(id: result[0][0], name: result[0][1], type: result[0][2], hp: result[0][3], db: db)
	end

	def alter_hp(hp, db)
		db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", [hp, @id])
	end

end
