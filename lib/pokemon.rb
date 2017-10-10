require 'pry'

class Pokemon

  attr_reader :id, :name, :type, :db

  def initialize(id:, name:, type:, db:)
    @id   = id
    @name = name
    @type = type
    @db   = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?);", name, type)
  end

  def self.find(id, db)
    pk_from_db = db.execute("SELECT * FROM pokemon WHERE id = (?);", id).flatten
    self.new(id: id, name: pk_from_db[1], type: pk_from_db[2], db: db)
  end
end
