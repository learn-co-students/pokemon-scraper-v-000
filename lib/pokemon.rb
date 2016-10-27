
class Pokemon
  attr_accessor :name, :type, :db, :id
  #attr_reader :id

  def initialize(name:, type:, db:, id:)
    @name = name
    @type = type
    @db = db
    @id = id
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type)
      VALUES (?, ?)", name, type)
  end


  def self.find(id, db)
    poke = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    pokemon = Pokemon.new(id: poke[0], name: poke[1], type: poke[2], db: db)
  end


end
