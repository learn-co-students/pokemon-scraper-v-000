require 'pry'

class Pokemon

  attr_accessor :id, :name, :type, :db, :hp
  @@all = []


  def initialize(id: nil, name: nil, type: nil, hp: 60, db: nil)
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db
    @@all << self
end

  def self.all
    @@all
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?);",name, type)
    self.new(id: db.execute("SELECT * FROM pokemon WHERE name = ?", name).flatten[0], name: db.execute("SELECT * FROM pokemon WHERE name = ?", name).flatten[1], type: db.execute("SELECT * FROM pokemon WHERE name = ?", name).flatten[2], db: db)
  end

  def self.find(id, db)
    self.all.bsearch {|pokemon| pokemon.id == id}
  end

  def alter_hp(hp, db)
    self.hp = hp
  end


end
