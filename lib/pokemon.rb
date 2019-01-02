class Pokemon
  
  attr_accessor :id, :name, :type, :db, :hp
  @@all = []
  
  def initialize(id:, name:, type:, hp: nil, db:)
    @id, @name, @type, @hp, @db = id, name, type, hp, db
    @@all << self
  end
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon(name, type) VALUES (?, ?)",name, type)
  end
  
  def self.find(id, db)
    pokemon_id = db.execute("SELECT * FROM pokemon WHERE id = #{id}")
    Pokemon.new(id: pokemon_id[0][0], name: pokemon_id[0][1], type: pokemon_id[0][2], db: db)
  end
  
  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
  end
end