class Pokemon
  attr_accessor :id, :name, :type, :db, :hp
  @@all =[]

  def initialize (id:, name:, type:, db:, hp: 60)
    @id = id
    @name = name
    @type = type
    @hp = hp
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
    data = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    self.new(id: data[0], name: data[1], type: data[2], hp: data[3], db: db)
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE pokemon.id = ?", hp, self.id)
  end
end
