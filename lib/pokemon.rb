require 'pry'

@@all = []

DEFAULT_HP = 60

class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(pokemon, hp=nil)
    @id = pokemon[:id]
    @name = pokemon[:name]
    @type = pokemon[:type]
    @db = pokemon[:db]
    @hp = pokemon[:hp]
    @@all << self
  end

  def self.save(name, type, database_connection)
    begin
      database_connection.execute("INSERT INTO pokemon (name, type, hp) VALUES (?, ?, ?);", name, type, DEFAULT_HP)
    rescue
      database_connection.execute("INSERT INTO pokemon (name, type) VALUES (?, ?);", name, type)
    end
  end

  def self.find(id, database_connection)
    array = database_connection.execute("SELECT * FROM pokemon WHERE id = (?);",id).flatten
    pokemon_obj = {
      id: array[0],
      name: array[1],
      type: array[2],
      hp: array[3] || DEFAULT_HP
    }
    self.new(pokemon_obj)
  end

  def alter_hp(new_hp, database_connection)
    database_connection.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
  end

end
