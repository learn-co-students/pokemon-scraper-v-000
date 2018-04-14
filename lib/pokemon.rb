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
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id_value, db)
    found_pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", id_value)
    self.new(id: found_pokemon[0][0], name: found_pokemon[0][1], type: found_pokemon[0][2], hp: found_pokemon[0][3], db: db)
  #  binding.pry
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, self.id)
  end
end
