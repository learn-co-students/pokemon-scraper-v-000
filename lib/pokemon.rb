require "pry"
class Pokemon
  attr_accessor :id, :name, :type, :db, :hp
  def initialize(id:, name:, type:, hp: nil, db:)
    @hp = hp
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(id, db)
    data = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
    pokemon = self.new(id: data.first[0], name: data.first[1], type: data.first[2], hp: data.first[3], db: db)
  end

  def alter_hp(hp_new, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp_new, self.id)
  end
end
