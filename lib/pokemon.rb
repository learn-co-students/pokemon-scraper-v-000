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
  end

  def self.save(name, type, db)
    # we need to save the name and type into the db table pokemons
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    p_array = db.execute("SELECT * FROM pokemon WHERE id = (?)", id).flatten
    name = p_array[1]
    type = p_array[2]
    hp = p_array[3]
    self.new(id: id, name: name, type: type, db: db, hp: hp)
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = (?) WHERE id = (?)", hp, self.id)
  end



end
