require 'pry'
class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  @@all = []

  def initialize(id:, name: , type: , db:, hp: 60)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type) #keep this line handy so you can refer back to it
  end

  def self.find(id, db)
    info = db.execute("SELECT * FROM pokemon WHERE id = (?)", id)[0]
    new_pokemon = Pokemon.new(id: info[0], name: info[1], type: info[2], db: db, hp: info[3])
    new_pokemon
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
  end




end
