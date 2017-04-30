class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, db:, hp: nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(name, type, db_connection)
    db_connection.execute('INSERT INTO pokemon (name, type) VALUES(?,?)', [name, type])
  end

  def self.find(id, db)
    pokemon_found = db.execute('SELECT * FROM pokemon WHERE id = ?', [id])
    self.new(id: pokemon_found[0][0], name: pokemon_found[0][1], type: pokemon_found[0][2], db: db, hp: pokemon_found[0][3])
  end

  def alter_hp(new_hp, db)
    self.hp = new_hp
    db.execute("UPDATE pokemon SET hp = ?",[new_hp])
  end
end
