require 'pry'
class Pokemon

  attr_accessor :name, :type, :id, :db, :hp

  @@all = []

  def initialize(id:, name:, type:, db:, hp: nil)
    @name = name
    @type = type
    @db = db
    @id = id
    @hp = hp
    @@all << self
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(id, db)
     from_db = db.execute("SELECT * FROM pokemon WHERE id = ?",id).flatten
     self.new(id:from_db[0], name:from_db[1], type:from_db[2], db:db, hp:from_db[3])
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE ID = ?",hp, @id)
  end

end
