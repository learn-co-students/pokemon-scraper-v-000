require "pry"
class Pokemon

  @@all = []

  attr_accessor :name, :type, :db, :id

  def initialize(attributes)
    attributes.each {|key, value| self.send(("#{key}="), value)}
    #@id = id.value
    #@name = name.value
    #@type = type.value
    #@db = db.value

    @@all << self
  end

  def self.all
    @@all
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(id, db)
    found1 = db.execute("SELECT * FROM pokemon WHERE id =(?)", id)
    found = found1[0]

    id = found[0]

    name = found[1]
    type = found[2]
    #binding.pry
    poke_hash = {id: id, name: name, type: type}
    Pokemon.new(poke_hash)
  end

end
