class Pokemon
	attr_accessor :id, :name, :type, :db, :hp

	def initialize(id: id, name: name, type: type, db: db, hp: hp=nil)
		@id = id
		@name= name
		@type = type
		@db = db
		@hp=hp
	end

	def self.save(name, type, database_connection)
		database_connection.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type )
	end	

	def self.find(id, db)
		temp=db.execute("SELECT * FROM pokemon WHERE ?=pokemon.id",id)[0] << db
		hash={
			id: temp[0],
			name:temp[1],
			type:temp[2],
			db:temp[4],
			hp:temp[3]
		}
		mon=self.new(hash)
		puts mon.hp
		mon
	end

	def alter_hp(newhp, db)
		db.execute("UPDATE pokemon SET hp=? WHERE id=?",newhp,self.id)
	end
end
