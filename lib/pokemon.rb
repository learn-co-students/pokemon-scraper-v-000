class Pokemon
	attr_accessor :name, :type, :db

	def initialize(id, name, type, db)
		@name = name
		@type = type
		@db = db
	end

	def self.save(name, type, db)
		db.execute("insert into pokemon (name, type) values (?, ?)", name, type)
	end

	def self.find(id, db)
		db.execute("select * from pokemon where pokemon.id = id")[0]
	end


end
