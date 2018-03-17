class Pokemon

  attr_accessor :id, :name, :type, :db, :hp

  @@all = []

  def initialize (id:, name:, type:, hp: nil, db:)
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
  end

  def self.find(id_num, db)
    pokemon_stat = db.execute("SELECT * FROM pokemon WHERE id = ?", id_num).flatten
    Pokemon.new(id: pokemon_stat[0], name: pokemon_stat[1], type: pokemon_stat[2], hp: pokemon_stat[3], db: db)
  end

  def alter_hp(a_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", a_hp, self.id)
  end
end
