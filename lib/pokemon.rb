class Pokemon
  attr_accessor :id, :name, :type, :hp, :db

  @@all = []

  def initialize(id:, name:, type:, db:, hp: nil)
    self.id = id
    self.name = name
    self.type = type
    self.db = db
    self.hp = hp
    @@all << self
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = #{hp} WHERE id = #{self.id}")
    self.hp = hp
  end

  def self.all
    @@all
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", [name, type])
  end

  def self.find(index, db)
    pokemon = db.execute("SELECT * FROM pokemon WHERE id = #{index}")
    Pokemon.new(id: pokemon[0][0], name: pokemon[0][1], type: pokemon[0][2], db: db, hp: pokemon[0][3])
  end
end
