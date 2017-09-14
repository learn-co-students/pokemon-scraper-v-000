require 'pry'

class Pokemon
  attr_accessor :name, :type, :db, :hp, :id

  def initialize(id:, name:, type:, db:, hp: nil)
    @id, @name, @type, @db, @hp = id, name, type, db, hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name,type)
  end

  def self.find(id_in, db)
    finder = db.execute("SELECT * FROM pokemon WHERE id = ?", id_in).flatten
    Pokemon.new(id: finder[0],name: finder[1],type: finder[2], hp: finder[3], db: db)
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, @id)
  end

end
