class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  @@all = []

  def initialize(id:, name:, type:, db:, hp: nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
    @@all << self
  end

  def self.save(pk_name, pk_type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",pk_name, pk_type)
  end

  def self.all
    @@all
  end

  def self.find(id, db)
    pokemon_data = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    Pokemon.new(id: pokemon_data[0], name: pokemon_data[1], type: pokemon_data[2], hp: pokemon_data[3], db: db)
  end

  def alter_hp(hp, db)
    db.execute(("UPDATE pokemon SET hp = ? WHERE id = ?"), hp, id)
  end
end
