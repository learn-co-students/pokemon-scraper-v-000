require 'pry'
class Pokemon
  attr_accessor :name, :type, :id, :db, :hp

  def initialize(id:, name:, type:, hp: nil, db:)
    @id, @name, @type, @hp, @db = id, name, type, hp, db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(i, db)
    p = db.execute("SELECT * FROM pokemon WHERE id = ?", i).flatten
    Pokemon.new(id: p[0], name: p[1], type: p[2], hp: p[3], db: db)
  end

  def alter_hp(newhp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", newhp, self.id )
  end

end
