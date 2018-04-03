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
    db.execute("INSERT INTO pokemon(name, type) VALUES (?, ?)", [name, type])
  end

  def self.find(id, db)
    pk = db.execute("SELECT * FROM pokemon WHERE id = (?)", [id]).flatten
    pk_name = pk[1]
    pk_type = pk[2]
    hp = pk[3] || nil
    pokemon = Pokemon.new(id: id, name: pk_name, type: pk_type, db: db,  hp: hp)
  end

  def alter_hp(hp, db)
    self.hp = hp
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", [hp, self.id])
  end
end
