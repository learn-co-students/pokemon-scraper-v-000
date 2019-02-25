require "pry"

class Pokemon
  attr_reader :id, :name, :type, :db, :hb
  @@all =[]

  def initialize (id, name, db, hb)
      @id = id
      @name = name
      @db = db
      @hb = hb
      @@all <<S self
  end

  def self.all
    @@all
  end

  def self.save(name, type, database_connection)
    database_connection.execute("INSERT INTO pokemon(name, type) VALUES (?, ?)" name, type)
  end
  






end
