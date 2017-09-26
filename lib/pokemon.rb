require 'pry'
class Pokemon
  attr_accessor :id, :name, :type, :db
  def initialize(db)
    @name = String.new
    @type = String.new
    @db = db
  end



  def self.save(name, type, db)
    sql = <<-SQL
       INSERT INTO pokemon
       (name, type)
       VALuES
       (?,?)
    SQL

    poke_data = db.execute(sql, name, type)
  end

  def self.find(id, db)
    sql = <<-SQL
      SELECT * FROM pokemon
      WHERE id = ?
    SQL

    poke_data = db.execute(sql, id)[0]

    new_poke = Pokemon.new(db)
    new_poke.name = poke_data[1]
    new_poke.type = poke_data[2]
    new_poke.id = poke_data[0]
    new_poke
  end


end
