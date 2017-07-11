class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(name:, type:, db:, id:, hp:)
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
    another_pokemon = db.execute("SELECT * FROM pokemon WHERE id=?", id).flatten
    p = Pokemon.new(id: another_pokemon[0], name: another_pokemon[1], type: another_pokemon[2], db:db)
    p
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
  end

end
