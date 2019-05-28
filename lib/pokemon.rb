require 'pry'

class Pokemon

    @@all = [ ]

    attr_accessor :name, :type, :db, :id, :hp

  def initialize  (name, type= nil, db= nil, id = nil, hp = nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
    end

  def self.all
    @@all
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon ( name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    array = db.execute("SELECT * FROM pokemon WHERE id = (?)", id)
    id = array[0][0]
    name = array[0][1]
    type = array[0][2]
    p = self.new(name, type, db = nil, id, hp = 60)
  end

def alter_hp(hp, db)
  id = self.id
  name = self.name
  db.execute("INSERT INTO pokemon ( name, type, hp) VALUES (?, ?, ?)", name, type, hp)
  end

end
