class Pokemon

  @@all = []

  attr_accessor :name, :type, :db, :id, :hp

  def initialize (id:, name:, type:, db:, hp: nil)
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
    pokemon = db.execute("SELECT * FROM pokemon WHERE id = (?)", id).flatten
    poke_hash = {
      :id => pokemon[0],
      :name => pokemon[1],
      :type => pokemon[2],
      :hp => pokemon[3],
      :db => db
    }
    Pokemon.new(poke_hash)
  end

  def alter_hp(new_hp, db)
    self.hp = new_hp
    # binding.pry
    db.execute("UPDATE pokemon SET hp = (?) WHERE id = (?)", new_hp, self.id)
  end
end
