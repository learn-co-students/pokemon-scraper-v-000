require 'pry'

class Pokemon

  attr_accessor :name, :id, :type, :db

  @@all = Array.new

  def initialize(hash)
    @id = hash[:id]
    @name = hash[:name]
    @type = hash[:type]
    @db = hash[:db]

    @@all << self
  end

  def self.save(name, type, database_connection)
     database_connection.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(id, database_connection)
    id_name_type = database_connection.execute("SELECT * FROM pokemon WHERE pokemon.id = id").join(",").split(",")
    @@all.detect{|pokemon| pokemon.id == id_name_type[0].to_i && pokemon.name == id_name_type[1] && pokemon.type == id_name_type[2]}
  end


end
