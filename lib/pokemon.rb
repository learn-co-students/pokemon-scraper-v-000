require 'pry'
class Pokemon
  attr_accessor :name, :type, :id, :db, :hp
  @@all = []
  def initialize(x)
    @id = x[:id]
    @name = x[:name]
    @type = x[:type]
    @db = x[:db]
    @hp = x[:hp]
  end

  def self.all
    @@all
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(i, db)
    p = db.execute("SELECT * FROM pokemon WHERE id = ?", i)
    p_hash = {
      :id => p[0][0],
      :name => p[0][1],
      :type => p[0][2],
      :hp => p[0][3]
    }
    Pokemon.new(p_hash)
  end

  def alter_hp(hp, db)
    char = self.name
    @hp = hp
    db.execute("UPDATE pokemon SET hp = ? WHERE name = ?", @hp, char)
  end

end
