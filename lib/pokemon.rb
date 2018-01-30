require 'pry'
class Pokemon

  attr_accessor :name, :type, :db, :id, :hp

  @@all = []

  def initialize(args)
    @id = args[:id]
    @name = args[:name]
    @type = args[:type]
    @db = args[:db]
    @hp = args[:hp]
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
    hp = e[0][3]
    args =  {:id => id, :name => name, :type => type, :hp => hp}
    Pokemon.new(args)
    #binding.pry
  end

  def alter_hp(hp, db)
    victim = self.name
    @hp = hp
    db.execute("UPDATE pokemon SET hp = ? WHERE name = ?", @hp, victim)
  end

end
