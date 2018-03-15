require 'pry'

class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, db:, hp: nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(id, db)
    @results = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
    self.new(id: @results[0][0], name: @results[0][1], type: @results[0][2], db: db, hp: @results[0][3])
  end

  def alter_hp(power, db)
    @hp = db.execute("UPDATE pokemon SET hp = ? WHERE name = ?", power, @name)
  end

end
