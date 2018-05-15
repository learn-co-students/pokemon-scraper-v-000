class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  @@all = []

  def self.all
    @@all
  end

  def initialize(id:, name:, type:, db:, hp: nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp

    @@all << self
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type)
    VALUES (?,?)", name, type)
  end

  def self.find(id, db)
    # self.all.detect {|a| a.id == id}
    # binding.pry
    pokemon_info = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    Pokemon.new(id: pokemon_info[0], name: pokemon_info[1], type: pokemon_info[2], hp: pokemon_info[3], db: db)

  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE name = ?", hp, self.name)

  end

end
