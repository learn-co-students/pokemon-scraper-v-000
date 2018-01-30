class Pokemon
  attr_accessor :id, :name, :type, :hp, :db

  def initialize(id:, name:, type:, hp: nil, db:)
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end


# finds a pokemon from the database by their id number and returns a new Pokemon object'
# The find method creates a new Pokemon after selecting their row from the database by their id number
  def self.find(id, db)
    find_pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    Pokemon.new(id: find_pokemon[0], name: find_pokemon[1], type: find_pokemon[2], db: db)
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, @id)
  end
end
