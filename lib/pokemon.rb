require "pry"

class Pokemon

  attr_accessor :id, :name, :type, :db, :hp

  @@all = []

  def initialize(params)
    @id = params[:id]
    @name = params[:name]
    @type = params[:type]
    @db = params[:db]
    @hp = nil
    @@all << self
  end

  # def self.all
  #   @@all
  # end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES(?, ?)", name, type)
  end

  def self.find(id, db)
    array = db.execute(
    "SELECT *
    FROM pokemon
    WHERE id = ?", id).flatten
    found_pokemon = @@all.detect{ |pokemon| pokemon.id == id }
    if found_pokemon == nil
      params = {id: array[0], name: array[1], type: array[2], db: db}
      new(params)
    else
      found_pokemon
    end
  end

  def alter_hp(new_hp, db)
    @hp = new_hp
    db.execute("UPDATE pokemon SET hp = #{new_hp} WHERE id = #{id}")
  end

end
