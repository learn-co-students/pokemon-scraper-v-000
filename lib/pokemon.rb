require 'pry'

class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize (id:, name:, type:, db:, hp: nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(name, type, database_connection)
  database_connection.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, database_connection)
    pokemon = database_connection.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    name = pokemon[1]
    type = pokemon[2]
    new_pokemon = self.new(id: id, name: name, type: type, db: database_connection)
  end

  def alter_hp(new_hp, db)
     db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
   end
end
