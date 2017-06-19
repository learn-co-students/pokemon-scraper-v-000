class Pokemon
  attr_accessor :name, :type, :db, :id, :hp

  def initialize(name:, type:, db:, id:, hp: nil)
    @name = name
    @type = type
    @db = db
    @id = id
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    found_pokemon = db.execute( "SELECT * FROM pokemon WHERE id = ?", id)
    Pokemon.new(id: found_pokemon[0][0], name: found_pokemon[0][1], type: found_pokemon[0][2], hp: found_pokemon[0][3], db: db)
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp =?  WHERE id = ?;", new_hp, self.id)
  end

end
