class Pokemon
  attr_accessor :name, :type, :id, :db, :hp

  def initialize(name:, type: nil, id: nil, db: nil, hp: 60)
    @name = name
    @type = type
    @id = id
    @db = db
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES ( ?, ?)", [name, type])
  end

  def self.find(id, db)
    new_pokemon = db.execute("SELECT * from pokemon WHERE id = ?", [id]).flatten
    Pokemon.new(name: new_pokemon[1], type: new_pokemon[2], id: new_pokemon[0], hp: new_pokemon[3])
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
  end


end
