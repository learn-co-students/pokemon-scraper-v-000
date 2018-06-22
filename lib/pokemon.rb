class Pokemon

  attr_accessor :id, :name, :type, :db

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
  end

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.find(num, db)
    new_pok = db.execute("SELECT *
    FROM pokemon
    WHERE pokemon.id = ?", num).flatten

    Pokemon.new(id: new_pok[0], name: new_pok[1], type: new_pok[2], db: db)
  end
end
