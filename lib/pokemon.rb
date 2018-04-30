require "pry"
class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize (id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save (name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find (id, db)
    db.results_as_hash = true
    results = db.execute("SELECT * FROM pokemon WHERE id=?",id)
    Pokemon.new(id: results[0]["id"], name: results[0]["name"], type: results[0]["type"], db: db)
  end
end
