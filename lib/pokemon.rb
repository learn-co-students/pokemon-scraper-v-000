require 'pry'

class Pokemon

  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, hp: nil, db:)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(id_number, db)
    pokemon_row = db.execute("SELECT * FROM pokemon WHERE id=?", id_number).flatten
    Pokemon.new(id: pokemon_row[0], name: pokemon_row[1], type: pokemon_row[2], hp:pokemon_row[3], db: db)
  end


    def alter_hp(hp = 60, db)
      db.execute("SELECT hp FROM pokemon").flatten.first = 60
    end
end
