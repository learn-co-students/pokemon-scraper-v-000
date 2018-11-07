require 'pry'
class Pokemon
  attr_accessor :id, :name, :type, :db

  @@all = []

  def initialize(id:, name:, type:, db:, hp: nil)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.all
    @@all
  end

  def self.save(name, type, db)
    id = self.all.count + 1
    db.execute("INSERT INTO pokemon VALUES (?, ?, ?)", id, name, type)
  end

  def self.find(id, db)
    new_pokemon = db.execute("SELECT * FROM pokemon WHERE id = #{id}")

    new_id = new_pokemon[0][0]
    name = new_pokemon[0][1]
    type =   new_pokemon[0][2]
    Pokemon.new(id: new_id,name: name,type: type, db: db, hp: 60)
  end


end
