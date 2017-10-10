require 'pry'

class Pokemon

  attr_reader :id, :name, :type, :db

  def initialize(id:, name:, type:, db:, hp: nil)
    @id   = id
    @name = name
    @type = type
    @db   = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?);", name, type)
  end

  def self.find(id, db)
    pk_from_db = db.execute("SELECT * FROM pokemon WHERE id = (?);", id).flatten
    self.new(id: id, name: pk_from_db[1], type: pk_from_db[2], db: db)
  end
  #
  # def alter_hp(hp, db)
  #   pk_from_db = Pokemon.find(self.id, db)
  #   db.execute("UPDATE pokemon SET hp = (?) WHERE pokemon.id = pk_from_db.id;", hp)
  # end
end
