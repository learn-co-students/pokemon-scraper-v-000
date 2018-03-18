require 'pry'

class Pokemon
  attr_accessor :name, :type, :db, :id, :hp

  @@pokemon = []

    def initialize(id = nil, name = nil, type = nil, db = nil, hp)
        @id = id
        @name = name
        @type = type
        @db = db
        @hp = hp
        @@pokemon << self
    end

    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
    end

    def self.find(id, db)
      pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", id).first #This is returning an array within an array, hence first
      pokemon2 = Pokemon.new(id = pokemon[0], name = pokemon[1], type = pokemon[2], hp = pokemon[3])
    end

    def alter_hp(hp, db)
      db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, self.id)
    end
end
