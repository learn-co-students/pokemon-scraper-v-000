require 'pry'
class Pokemon

  attr_accessor :name, :type, :db, :id, :hp

  def initialize(id: id, name: name, type: type, db: db, hp: hp)
    @name = name
    @type = type
    @db = db
    @id = id
    @hp = hp
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", [new_hp, id])
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type)
                VALUES (?, ?);", [name, type])
  end

  def self.find(id, db)
    data = db.execute("SELECT * FROM pokemon WHERE id = ?;", [id])[0]
    self.new(id: data[0], name: data[1], type: data[2], db: db, hp: data[3])
  end
end
