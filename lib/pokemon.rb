require 'pry'
class Pokemon

  attr_accessor :name, :type, :db, :id

  def initialize(id:"1", name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
  end

  def self.find(id, db)
    resultset = db.execute("SELECT * FROM pokemon WHERE id = ?", id)

    new_pokemon = self.new(:id => resultset.first[0],
             :name => resultset.first[1],
             :type => resultset.first[2],
             :db => db)
    new_pokemon
  end


end
