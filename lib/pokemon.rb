require 'pry'

class Pokemon

  attr_accessor :name, :type, :id, :db

  @@all = []

  def initialize(id,name,type,db)
    @id = id
    @db = db
    @name = name
    @type = type
    @@all<<self

  end

  def self.all
    @@all
  end

  def self.save(name,type,db)
  db.execute("INSERT INTO pokemon (name,type) VALUES (?,?)",name,type)
  end

  def self.find(id,db)
    index = id

    query = db.execute("SELECT * FROM pokemon WHERE id = #{index}")
    query if query != nil

  end



  

end
