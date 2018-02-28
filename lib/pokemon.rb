class Pokemon

	attr_accessor :id, :name, :type, :db, :hp
		
	def initialize(object)
		object.each do |x|
			@id = x[0]
			@name = x[1]
			@type = x[2]
			@hp = x[3] if x[3] != nil
		end
			@db = db
	end

	def self.save(name, type, db)
		db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
	end

	def self.find(id, db)
		self.new(db.execute("SELECT * FROM pokemon WHERE id = id;"))
	end

	def alter_hp(hp, db)
		db.execute("UPDATE pokemon SET hp = #{hp} WHERE #{self.id} = id;")
	end

end
