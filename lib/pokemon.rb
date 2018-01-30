require 'pry'

class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  @@all = []

  def initialize(id:, name:, type:, db:, hp: nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp

    @@all << self
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    attr_array = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    pokemon = self.new(id: id, name: attr_array[1], type: attr_array[2], hp: attr_array[3], db: db)
    pokemon
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp=?  WHERE id=?", new_hp, self.id)
  end
end
