require 'pry'
class Pokemon
  attr_accessor :id, :name, :type, :db, :hp 

  @@all = []

  def initialize(hash)
    hash.each {|key,value| self.send(("#{key}="),value)}
    @@all << self 
  end

  def self.all
    @@all 
  end 

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
  end 

  def self.find(id, db) 
    pokemon = db.execute("SELECT * FROM pokemon WHERE id=(#{id})")
    poke_hash = {}
    poke_hash[:id]=pokemon[0][0]
    poke_hash[:name]=pokemon[0][1]
    poke_hash[:type]=pokemon[0][2]
    poke_hash[:hp]=pokemon[0][3]
    new_poke = self.new(poke_hash)
  end 

  def alter_hp(power, db)
    self.hp = power
    db.execute("UPDATE pokemon SET hp=? WHERE id=?;", self.hp, self.id)
  end 

end
