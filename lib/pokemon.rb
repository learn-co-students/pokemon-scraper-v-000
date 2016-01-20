class Pokemon
	attr_accessor :name, :type,:db,:id
	@@all= []

	def initialize (id,name, type, db)
		self.id = id
		self.name = name
		self.type = type
		self.db =db
		@@all << self

	end

	def self.save (name, type,db)	
		db.execute('INSERT INTO pokemon(name,type) VALUES(?,?);', name, type)
	end

	def self.find(id,db)
		db.execute('SELECT * FROM pokemon WHERE id = ?;', id).first
	end









		

end
