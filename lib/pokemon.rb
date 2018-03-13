require 'pry'

class Pokemon
  attr_accessor :name, :type, :db, :id, :hp

  @@all = []

  def initialize(pokemon, hp = nil)
    @id = pokemon[:id]
    @name = pokemon[:name]
    @type = pokemon[:type]
    @hp = pokemon[:hp]
    @db  = db
    @@all << pokemon
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?);", name, type)
  end

  def self.find(idn, db)
    row = db.execute("SELECT * FROM pokemon WHERE id = ?;", idn).flatten
    new_pokemon = {id: row[0], name: row[1], type: row[2], db: db, hp: row[3]}
    self.new(new_pokemon)
  end

  def alter_hp(hpn, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hpn, self.id)
  end

end
