class Pokemon

  attr_accessor :id, :name, :type, :db

  # def initialize(id:, name:, type:, db:)
  #   @id = id
  #   @name = name
  #   @type = type
  #   @db = db
  # end
  def initialize(id:, name:, type:, db:)
      @id, @name, @type, @db = id, name, type, db
    end

  def self.save(name, type, database)
    database.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(id_number, db)
    find_pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", id_number).flatten
    Pokemon.new(id: find_pokemon[0], name: find_pokemon[1], type: find_pokemon[2], db: db)
  end
end
