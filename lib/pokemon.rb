require 'pry'

class Pokemon

  @@counter = 0

  attr_accessor :name, :type, :db, :id, :hp

  def initialize(info)
    @name = info[:name]
    @type = info[:type]
    @db = info[:db]
    @id = info[:id]

    info[:hp] ||= nil
    @hp = info[:hp]
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES ('#{name}', '#{type}')")
  end

  def self.find(id, db)
    pokemon_array = db.execute("SELECT * FROM pokemon WHERE id = '#{id}'")
    pokemon_hash = {}
    pokemon_hash[:id] = pokemon_array[0][0]
    pokemon_hash[:name] = pokemon_array[0][1]
    pokemon_hash[:type] = pokemon_array[0][2]
    pokemon_hash[:db] = db


    pokemon_hash[:hp] = pokemon_array[0][3]
    pokemon_object = Pokemon.new(pokemon_hash)
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = '#{new_hp}' WHERE id = #{self.id}");
  end

end
