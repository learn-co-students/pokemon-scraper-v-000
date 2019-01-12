class Pokemon


attr_accessor :id, :name, :type, :db, :hp


  def initialize(id:, name:, type:, db:, hp:nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(name, type, db)
   db.execute("INSERT INTO pokemon(name, type) VALUES(?, ?)", name, type)
  end

  def self.find(id_number, db)
    pokemon_find = db.execute("SELECT * FROM pokemon WHERE id=?", id_number).first
    Pokemon.new(id: pokemon_find[0], name: pokemon_find[1], type: pokemon_find[2], db: db, hp: pokemon_find[3], )
  end

  def alter_hp(health, db)
    db.execute("UPDATE pokemon SET hp=? WHERE id=?", health, id)
  end

end #ends class
