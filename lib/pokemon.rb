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
    hash = {id: id, name: db.execute("SELECT name FROM pokemon WHERE id = ?", id).flatten.first, type: db.execute("SELECT type FROM pokemon WHERE id = ?", id).flatten.first, db: db}
    self.new(hash)
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, self.id)
  end

end
