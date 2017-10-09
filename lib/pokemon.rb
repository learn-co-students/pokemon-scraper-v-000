require 'pry'

class Pokemon
  attr_accessor :name, :type, :db, :id, :hp


  def initialize(id: nil, name:, type:, db:, hp: nil)
    @name = name
    @type = type
    @db = db
    @id = id
    @hp = hp
  end

  def self.save(name, type, db)
    db.prepare("INSERT INTO pokemon (name, type) values (?, ?)").execute(name, type)
  end

  def self.find(id, db)
    result = db.execute("SELECT * FROM pokemon WHERE id = ?", id).first
    self.new(id: result[0], name: result[1], type: result[2], hp: result[3], db: db)
  end

  def alter_hp(hp, db)
    db.prepare("UPDATE pokemon SET hp = ? WHERE id = ?").execute(hp, id)
  end
end
