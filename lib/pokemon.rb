class Pokemon
  attr_accessor :name, :type, :hp, :id, :db
  
  def initialize(name:, type:, hp: 60, id:, db:)
    @name = name
    @type = type
    @hp = hp
    @id = id
    @db = db
  end
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end
  
  def self.find(id, db)
    pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", id).first
    new_pokemon = Pokemon.new(id: pokemon[0], name: pokemon[1], type: pokemon[2], hp: pokemon[3], db: db)
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ?", hp)
  end
end