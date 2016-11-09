require 'pry'
class Pokemon
  attr_accessor :name, :type, :db, :id, :hp

  @@all = []

  def initialize(id: id, name: name, type: type, hp: nil, db: db)
    @name = name
    @type = type
    @db = db
    @id = id
    @hp = hp
  end

  def self.all
    @@all
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(id, db)
    attributes = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    new_id = attributes[0]
    name = attributes[1]
    type = attributes[2]
    hp = attributes[3]
    Pokemon.new(id: new_id, name: name, type: type, hp: hp, db: db)
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, self.id)
  end

end
