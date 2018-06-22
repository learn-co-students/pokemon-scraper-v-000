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
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)",name,type)
  end

  def self.find(id, db)
    inserts = db.execute("SELECT * FROM pokemon WHERE pokemon.id = ?", id).flatten
    Pokemon.new(id: id, name: inserts[1], type: inserts[2], db: db)
    # binding.pry
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE name = ?", new_hp, self.name)
  end
end
