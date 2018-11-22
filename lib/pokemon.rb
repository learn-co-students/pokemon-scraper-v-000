require 'pry'
class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  @@all = []

  def initialize( id:, name:, type:, hp: nil, db: )
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
    pika = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    Pokemon.new(id: pika[0], name: pika[1], type: pika[2], db: db)
  end

  def alter_hp(current_hp, id)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", current_hp, self.id)
  end

end
