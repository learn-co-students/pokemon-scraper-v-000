class Pokemon

  attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(pokemon_id, db)
    pokemon_array = db.execute("SELECT * FROM pokemon WHERE id = ?", pokemon_id)
    pokemon_array.flatten# binding.pry
    # Pokemon.new(id: id, name: name, type: type, db: db)
  end


end
