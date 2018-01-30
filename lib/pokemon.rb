require "pry"
class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  @@all = []
  def initialize(id:, name:, type:, db:, hp: nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
    @@all << self
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(num, db)
    pokemon_info = db.execute("SELECT * FROM pokemon WHERE id = (?)", num).flatten
    Pokemon.new(id: pokemon_info[0], name: pokemon_info[1], type: pokemon_info[2], db: db, hp: pokemon_info[3])
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = (?) WHERE id = (?)", new_hp, @id)
  end

  def self.all
    @@all
  end
end
