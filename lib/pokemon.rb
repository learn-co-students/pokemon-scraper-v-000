require 'pry'
class Pokemon
  attr_accessor :id, :name, :type, :db, :hp
  @@all = []
  
  def initialize(id:, name:, type:, hp: 60, db:)
   @id = id
   @name = name
   @type = type
   @hp = hp
   @@all << self
  end
  
  def self.all
    @@all
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end
  
  def self.find(id, db)
    pokemon_array = db.execute("SELECT * FROM pokemon WHERE id = #{id}").flatten
    pokemon = Pokemon.new(id: id, name: "#{pokemon_array[1]}", type: "#{pokemon_array[2]}", hp: pokemon_array[3], db: @db)
  end
  
  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?;",hp, self.id)
    
  end
end
