require 'pry'
class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(id = nil, name =  nil, type =  nil, db =  nil)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (id, name, type)  VALUES(?,?,?)", 1, name, type)
  end

  def self.find(id, db)
    name = db.execute("SELECT name FROM pokemon WHERE id = #{id}")[0][0]
    type = db.execute("SELECT type FROM pokemon WHERE id = #{id}")[0][0]
    pokemon = Pokemon.new(id, name, type, db)
  end
end
