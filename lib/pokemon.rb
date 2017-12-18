class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(pokemon_id, db)
    result = db.execute("SELECT * FROM pokemon WHERE id = ?", pokemon_id.to_i)[0]
    self.new(id: result[0], name: result[1], type: result[2], db: result[3])
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ?", new_hp)
  end

end
