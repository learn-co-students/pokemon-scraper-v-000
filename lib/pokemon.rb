require 'pry'
class Pokemon
  attr_accessor :name, :type, :db, :id, :hp

  def initialize (id:, name:, type:, db:, hp: NIL)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    pokemon_info = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten

    pokemon_found = Pokemon.new(
      id: pokemon_info[0],
      name: pokemon_info[1],
      type: pokemon_info[2],
      db: db,
      hp: pokemon_info[3]
    )
    pokemon_found
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = #{self.id}", hp)
  end

end
