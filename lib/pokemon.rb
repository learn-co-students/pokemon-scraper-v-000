class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, db:, hp: nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon ( name, type ) VALUES ( ?, ? )", [name, type])
  end

  def self.find(id, db)
    new_pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", [id]).flatten
    self.new(id: new_pokemon[0], name: new_pokemon[1], type: new_pokemon[2], hp: new_pokemon[3], db:db)
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ?", [hp])
  end

end
