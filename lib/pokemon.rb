
class Pokemon

	attr_accessor :name, :type, :db, :id, :hp

	def initialize(name:, type:, id:, hp: 60, db:)
		@name = name
		@type = type
		@db = db
		@id = id
		@hp = hp
	end

	def self.save(name, type, db)
		db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
	end

  	def self.find(id_number, db)
			poke_deets = db.execute("SELECT * FROM pokemon WHERE id=?", id_number).flatten
			#binding.pry
			Pokemon.new(id: poke_deets[0], name: poke_deets[1], type: poke_deets[2], hp: poke_deets[3], db: db)
 		end

  def alter_hp(hp, db)
  	db.execute("UPDATE pokemon SET hp =? WHERE id=?", hp, self.id)
  end

end


