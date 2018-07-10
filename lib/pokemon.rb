require 'pry'

class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, db:)
    self.id = id
    self.name = name
    self.type = type
    self.db = db
  end

  # Class Methods

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    id, name, type = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    return self.new(id: id, name: name, type: type, db: db)
  end
end
