class Pokemon
  attr_accessor :id, :name, :type, :db

  @@all = []

  def initialize(id:, name:, type:, db:)
    @name = name
    @type = type
    @db = db
    @id = id
    @@all << self
  end

  def self.save(@id, @name, @type, @db)
    #db = SQLite3::Database.new('db/pokemon.db')
    db.execute("INSERT INTO pokemon (id, name, type) VALUES (?, ?, ?)", @name, @type, )
    end
  end

  def self.find(id_number, db)
    pokemon_database_items = []
    pokemon_database_items = db.execute("SELECT * FROM pokemon WHERE id = '#{id_number}'")
    Pokemon.new(id: pokemon_database_items[0], name: pokemon_database_items[1], type: pokemon_database_items[2], db: db)
    binding.pry
  end

end
