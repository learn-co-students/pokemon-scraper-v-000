
require 'pry'
class Pokemon

  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, hp: nil, db:)
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db
  end

  def self.save(name, type, db)
    ins = db.prepare('INSERT INTO pokemon (name, type) VALUES (?, ?)')
    ins.execute(name, type)
  end

  def self.find(id, db)
    pokemon = db.execute("SELECT name, type FROM pokemon WHERE id = (?);", id).flatten
    name = pokemon[0]
    type = pokemon[1]
    Pokemon.new(id: id, name: name, type: type, db: db)
  end

  #def alter_hp(new_hp, db)
  #  self.hp = new_hp
  #  ins = db.prepare("UPDATE pokemon SET hp = (?) WHERE id = (?)")
  #  ins.execute(new_hp, self.id)
  end
end
