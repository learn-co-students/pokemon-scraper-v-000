require 'pry'

class Pokemon

  attr_accessor :id, :name, :type, :db, :hp

  def initialize(keywords)
    keywords.each do |attribute, value|
      self.send("#{attribute}=", value)
    end
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    poke = db.execute('SELECT * FROM pokemon WHERE id = ?', id).flatten
    Pokemon.new(id: poke[0], name: poke[1], type: poke[2], hp: poke[3], db: db)
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, id)
  end
end
