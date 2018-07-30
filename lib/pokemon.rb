require 'pry'
class Pokemon
  attr_accessor :id, :name, :type, :db, :hp
  @@all = []

  def initialize(id:, name:, type:, db:, hp: nil)
    self.id = id
    self.name = name
    self.type = type
    self.db = db
    self.hp = hp
    self.class.all << self
  end

  def self.save(name, type, db)
     db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
  end

  def self.find(primary_key, db)
    SQLRunner.new(db).execute_create_hp_column
    pokemon_arr = db.execute("SELECT * FROM pokemon WHERE id = ?", primary_key).flatten
    new_pokemon = Pokemon.new(id: pokemon_arr[0], name: pokemon_arr[1], type: pokemon_arr[2], hp: pokemon_arr[3], db: db)
  end

  def self.all
    @@all
  end

end
