require 'pry'

class Pokemon
  attr_accessor :id, :name, :type, :db
  @@all = []
  
  def initialize (id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.save(name, type, db)
    database_connection = SQLRunner.new('db/pokemon.db')
    database_connection.execute_sql("INSERT INTO pokemon (name, type) VALUES (?, ?, ?)")
  end
end
