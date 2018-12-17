class Pokemon

attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (id, name, type) VALUES (?,?,?)", @id, name, type)
  end

  def self.find(id, db)
    pokemon = db.execute("SELECT * FROM pokemon WHERE id=?",id)
    new_pokemon = self.new(id: pokemon[0][0],name:pokemon[0][1],type:pokemon[0][2], db:db)
    new_pokemon
  end

  def alter_hp(new_hp,db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, @id)
    self.hp = new_hp
  end

end
