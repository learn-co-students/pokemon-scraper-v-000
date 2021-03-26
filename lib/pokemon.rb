require 'pry'

class Pokemon
  attr_accessor :id, :name, :type, :db
  
  def initialize(pokemon)
    @id = pokemon[:id]
    @name = pokemon[:name]
    @type = pokemon[:type]
    @db = pokemon[:db]
  end

  def self.save(name, type, db)
    sql = <<-SQL
      INSERT INTO pokemon (name, type)
      VALUES (?, ?);
    SQL
    db.execute(sql, name, type)
    @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
  end
  
  def self.find(id, db)
    pokemon = {}
    sql = <<-SQL
      SELECT *
      FROM pokemon
      WHERE id = ?
    SQL
    pokemon_found = db.execute(sql, id)
    pokemon[:id] = pokemon_found[0][0]
    pokemon[:name] = pokemon_found[0][1]
    pokemon[:type] = pokemon_found[0][2]
    pokemon[:db] = db
    self.new(pokemon)
  end
end



