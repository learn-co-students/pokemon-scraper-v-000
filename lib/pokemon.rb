require 'pry'
class Pokemon
    
  attr_accessor :id, :name, :type, :hp, :db
  @@all = []

	def initialize(id:, name:, type:, hp: nil, db:)
		@id = id
		@name = name
		@type = type
		@db = db
    @hp = hp
		@@all << self
	end
    
  def self.all
  	@@all
  end

  def self.save(name, type, db)
  	db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end
  
  def self.find(id, db)
  	record_from_db = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    id = record_from_db[0]
    name = record_from_db[1]
    type = record_from_db[2]
    hp = record_from_db[3]
     # binding.pry
  	pokemon = Pokemon.new(id:id, name:name, type:type, hp:hp, db:db)
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)	
  end

end
	