class Pokemon

attr_accessor :name, :type, :db, :id

@@all = []

  def initialize(id, name, type, db)
    @id = id
    @name = name
    @type = type
    @db = db
    @@all << self
  end

  def self.all
    @@all
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(id, db)
    db.execute("SELECT id, name, type FROM pokemon WHERE id = pokemon.id")
  end

#  def alter_hp(new_hp)
#    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?, new_hp, id")
#  end

end
