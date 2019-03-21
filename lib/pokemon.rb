class Pokemon

     attr_accessor :id, :name, :type, :hp, :db


  def initialize(id:, name:, type:, hp: nil, db:)
      @id = id
      @name = name
      @type = type
      @hp = hp
      @db = db
      @@all << self
  end

    @@all = []


 def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
    @@all << self
 end


def self.find(id, db)
    pokemon_find = db.execute("SELECT * FROM pokemon WHERE id=?", id).flatten
    Pokemon.new(id: pokemon_find[0], name: pokemon_find[1], type: pokemon_find[2], hp: pokemon_find[3], db: db)
end



def bonus_round(new_hp, db)
    alter_round = db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id).flatten
    Pokemon.new(id: alter_round[0], hp: alter_round)
 end
end
