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
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    the_pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    self.new(id: the_pokemon[0], name: the_pokemon[1], type: the_pokemon[2], hp: the_pokemon[3], db: db)
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, id)
  end

end
