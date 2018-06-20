class Pokemon
  attr_accessor :name, :type, :db, :hp
  attr_reader :id

  @@all = []

  def initialize(id:, name:, type:, db:, hp: 60)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
    @@all << self
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon(name, type) VALUES(?, ?)", name, type)
  end

  def self.all
    @@all
  end

  def self.find(id, db)
    selected_pokemon = db.execute("SELECT * FROM pokemon WHERE pokemon.id = ?", id).flatten
      Pokemon.new(id: selected_pokemon[0], name: selected_pokemon[1], type: selected_pokemon[2], hp: selected_pokemon[3], db:db)
  end

  #bonus
  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, self.id)
  end
end
