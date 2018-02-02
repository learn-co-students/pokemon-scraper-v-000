require 'pry'

class Pokemon
  attr_reader :id, :name, :type, :db, :hp
  @@all = []

  def initialize (id:, name:, type:, db:, hp: 60)
    @name = name
    @type = type
    @id = id
    @db = db
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name,type) VALUES (?,?)",[name,type])
  end

  def self.find(id_in, db)
    pokemon_info = db.execute("SELECT * FROM pokemon WHERE id = ?",id_in).flatten
    new_poke = Pokemon.new(id: id_in, name: pokemon_info[1], type: pokemon_info[2], db: db, hp: pokemon_info[3])
  end

  def alter_hp(hp_in, db)
    @hp = hp_in
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", [hp_in, self.id])
  end
end
