require 'pry'

class Pokemon

  attr_accessor :id, :name, :type, :db

  @@all = []

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
    self.class.all << self
  end

  def self.all
    @@all
  end

  def self.save(name, type, database)
    database.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
  end

  def self.find(id, database)
    result = database.execute("SELECT * FROM pokemon WHERE pokemon.id = ?", id)
    data = result.flatten
    pokemon = self.new(id: data[0], name: data[1], type: data[2], db: database)
    pokemon
  end

end
