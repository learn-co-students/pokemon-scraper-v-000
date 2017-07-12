require 'pry'
class Pokemon

  attr_accessor :name, :type, :db, :id

  @@all = []

  def initialize(args)
    @id = args[:id]
    @name = args[:name]
    @type = args[:type]
    @db = args[:db]
    #binding.pry
    #db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.all
    @@all
  end

  def self.save(pk_name, pk_type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", pk_name, pk_type)
  end

  def self.find(i, db)
    e = db.execute("SELECT * FROM pokemon WHERE id = ?", i)
    id = e[0][0]
    name = e[0][1]
    type = e[0][2]
    args =  {:id => id, :name => name, :type => type}
    Pokemon.new(args)
    #binding.pry
  end
end
