class Pokemon
  require 'pry'
  attr_accessor :name, :id, :type, :db, :hp

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
    #@hp = hp
  end

  def self.save(name, type, db)
    sql = <<-SQL
      INSERT INTO pokemon (name, type)
      VALUES (?, ?)
    SQL

    db.execute(sql, name, type)

  end

  def self.find(id, db)
    sql = <<-SQL
      SELECT *
      FROM pokemon
      WHERE id = ?
    SQL

    pokemon = db.execute(sql, id).flatten
    #binding.pry
    Pokemon.new(id: pokemon[0], name: pokemon[1], type: pokemon[2], db: db)
    #new_pokemon.id = pokemon[0]
    #new_pokemon.name = pokemon[1]
    #new_pokemon.type = pokemon[2]
    #new_pokemon
      #binding.pry
  end

  def alter_hp(new_hp, db)
    sql = <<-SQL
      UPDATE pokemon SET hp = ? WHERE id = ?
    SQL
    db.execute(sql, [new_hp, self.id])
  end
end
