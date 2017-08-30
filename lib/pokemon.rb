class Pokemon
  attr_accessor :id, :name, :type, :db, :hp
  def initialize (id, name=nil, type=nil, db=nil, hp=60)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon(name, type) VALUES (?,?)", name, type)
  end

  def self.find(id, db)
    pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    Pokemon.new(pokemon[0],pokemon[1],pokemon[2], db, pokemon[3])
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = (?) WHERE name = (?);", new_hp, self.name)
  end


end
