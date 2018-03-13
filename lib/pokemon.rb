class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = 60
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",[name,type])
  end

  def self.find(id, db)
    array = db.execute("SELECT id,name,type FROM pokemon WHERE pokemon.id = (?)", id)
    pokemon_found = Pokemon.new(id: array[0][0],name: array[0][1],type: array[0][2], db: db)
    pokemon_found
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = (?) WHERE id = (?)",[hp, self.id])
    @hp = hp
  end

end
