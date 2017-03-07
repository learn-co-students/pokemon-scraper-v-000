require 'pry'

class Pokemon

  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id: 1, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(id, db)
    name = db.execute("SELECT pokemon.name FROM pokemon WHERE id = id;").join(',')
    type = db.execute("SELECT pokemon.type FROM pokemon WHERE id = id;").join(',')
    #hp = db.execute("SELECT pokemon.hp FROM pokemon WHERE id = id;").join(',')
    Pokemon.new(id: id, name: name, type: type, db: db)
  end

end
