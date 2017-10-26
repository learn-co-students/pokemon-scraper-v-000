require 'pry'
class Pokemon
attr_accessor :id, :name, :type, :db, :hp
  @@all = []
  def initialize(input)
    @id = input[:id]
    @name = input[:name]
    @type = input[:type]
    @hp = 60
    @@all << self
  end

  def self.all_pokemon
    @@all
  end


  def self.save(name,type,db)
    i= db.execute("SELECT * FROM pokemon;").length+1
    db.execute( "INSERT INTO pokemon VALUES (?, ?,?,?)", i, name, type,60)
  end

  def self.find(id,db)
    pokemon_array = db.execute("SELECT * FROM pokemon WHERE id = ?;", id).first
    self.all_pokemon.select {|pokemon| pokemon.id==pokemon_array[0]}.first
  end

  def alter_hp(hp,db)

    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?;", hp, self.id)
    self.hp = hp
  end

end
