class Pokemon
  attr_accessor :name, :type, :db, :id, :hp
@@all = []

  def initialize(id:, name:, type:, db:, hp: 60)
    @name = name
    @type = type
    @db = db
    @@all << self
    @id = id
    @hp = hp
  end

  def self.all
    @@all
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(pokemon_id, db)
      selected_poke = db.execute("SELECT * FROM pokemon WHERE pokemon.id = ?", pokemon_id).flatten
      Pokemon.new(id: selected_poke[0], name: selected_poke[1], type: selected_poke[2], hp: selected_poke[3], db: db)
  end

def alter_hp(hp, db)
  db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, @id)
  #db.execute("SELECT hp FROM pokemon WHERE id = ?", @id)

#pikachu.alter_hp(50, @db) should change the @hp value to 50 from 60 and should update the table
  #db.execute("UPDATE pokemon SET hp = ? WHERE need way to select correct pokemon from table"

end
end
