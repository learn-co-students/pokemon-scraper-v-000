class Pokemon
	attr_accessor :id, :name, :type, :db, :hp

	def initialize(id: nil, name:, type:, db:, hp: nil)
		self.id = id
		self.name = name
		self.type = type
		self.hp = hp
		@db = db
	end

	def self.save(name, type, db)
		db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
	end

	def self.find(id_number, db)
		sql = <<-SQL
			SELECT * FROM pokemon WHERE id = ?;
		SQL
		pokemon = db.execute(sql, id_number)
		self.new(id: id_number, name: pokemon[0][1], type: pokemon[0][2], hp: pokemon[0][3], db: db)
	end

	def alter_hp(new_hp, db)
		db.execute("UPDATE pokemon SET hp = ? WHERE id = ?;", new_hp, self.id)
	end
end
