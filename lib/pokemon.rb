class Pokemon

attr_accessor :name, :type, :db, :id, :hp

  def initialize(id:, name:, type:, hp: nil, db: @db)
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db
  end

  def self.save(pokename, poketype, pokedb)
    pokedb.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", pokename, poketype)
  end

  def self.find(pokeid, pokedb)
    pokeinfo = pokedb.execute("SELECT * FROM pokemon WHERE id = ?", pokeid).flatten
    Pokemon.new(id: pokeinfo[0], name: pokeinfo[1], type: pokeinfo[2], hp: pokeinfo[3], db: pokedb)
  end

  def alter_hp(pokehp, pokedb)
    pokedb.execute("UPDATE pokemon SET hp = ? WHERE id = ?", pokehp, self.id)
  end

end
