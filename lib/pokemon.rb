class Pokemon

  attr_accessor :name, :type, :db, :id

  @@all = []

  def initialize (id: nil, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
    @@all << self
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon(name, type) VALUES (?, ?)", name, type)
  end


  def self.find(id, db)
    all_pokemon = db.execute("SELECT * FROM pokemon WHERE pokemon.id = (?)", id).flatten
    Pokemon.new(id: all_pokemon[0], name: all_pokemon[1], type: all_pokemon[2], db: db)
  end


end
