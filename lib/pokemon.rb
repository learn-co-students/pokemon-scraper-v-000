require 'pry'

class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, db:, hp: nil)
    self.id = id
    self.name = name
    self.type = type
    self.db = db
    self.hp = hp if hp
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, id)
  end

  # Class Methods

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    id, name, type, hp = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    return self.new(id: id, name: name, type: type, db: db, hp: hp)
  end
end
