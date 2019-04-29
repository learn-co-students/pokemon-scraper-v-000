class Pokemon
  attr_accessor :id, :name, :type, :hp, :db
  
  def initialize(id:, name:, type:, hp: nil, db:)
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db
  end
  
  def self.save(name, type, db)
    db.execute("INSERT INTO Pokemon (name, type) VALUES (?, ?)", name, type)
  end
  
  def self.find(id_number, db)
    found_pokemon = db.execute("SELECT * FROM Pokemon WHERE id = ?", id_number).flatten
    Pokemon.new(id: found_pokemon[0], name: found_pokemon[1], type: found_pokemon[2], hp: found_pokemon[3], db: db)
  end
  
  def alter_hp(new_hp, db)
    db.execute("UPDATE Pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
  end
end
