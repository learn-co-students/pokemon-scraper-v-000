require 'pry'
class Pokemon
  attr_accessor :name, :type, :db, :id, :hp

  @@all = []

  def initialize(hash)
    hash.each do |key, value|
      self.send("#{key}=", value)
    end
    @@all << self
  end

  def self.all
    @@all
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(id, db)
    @@all.find {|pokemon| pokemon.id == id}
  end

  def alter_hp(hp, db)
    self.hp = hp
  end

end
