class Pokemon
  attr_accessor :id, :name, :type, :hp, :db

  @@all = []

  def initialize(id: nil, name: nil, type: nil, hp: 60, db: nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
    @@all << self
  end

  def self.all
    @@all
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
    self.all << self
  end

  def self.find(id, db)
    # attributes = db.execute("SELECT * FROM pokemon WHERE pokemon.id = ?", id).flatten
    # Pokemon.new(id: id, name: attributes[1], type: attributes[2], hp: 60, db: db)
    # binding.pry
    @@all[id - 1]
  end

  def alter_hp(new_hp, db)
    db.execute("INSERT INTO pokemon (hp) VALUES (?)", new_hp)
  end

end
