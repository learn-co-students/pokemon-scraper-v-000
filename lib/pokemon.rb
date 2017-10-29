class Pokemon

  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id = nil, name = nil, type = nil, db = nil, hp = 60)
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
    pokemon = db.execute("SELECT * FROM pokemon WHERE id = (?)", id)[0]
    Pokemon.new(id = pokemon[0], name = pokemon[1], type = pokemon[2])
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?",new_hp, @id)
  end




end
