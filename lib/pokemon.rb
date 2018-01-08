require 'pry'
class Pokemon
  attr_accessor :id, :name, :type, :db, :hp
  
  # @@all = []
  
  def initialize(id:, name:, type:, hp: nil, db:)
    # @id = id
    # @name = name
    # @type = type
    # @db = db
    # @@all << self
    @id, @name, @type, @hp, @db = id, name, type, hp, db
  end
  
  # def self.all
  #   @@all
  # end
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end
  
  def self.find(number, db)
    pokemon_info = db.execute("SELECT * FROM pokemon WHERE id=?", number).flatten
    Pokemon.new(id: pokemon_info[0], name: pokemon_info[1], type: pokemon_info[2], hp: pokemon_info[3], db: db)
  end
end
 