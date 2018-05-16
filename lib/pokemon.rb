require 'pry'

class Pokemon

attr_accessor :id, :name, :type, :db

  # def initialize(id:, name:, type:, db:) #passes
  def initialize(name:, type:, db:, id:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db) # used to pass
  # def self.save(name:, type:, db:)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type) #passes
    sql = <<-SQL
      INSERT INTO songs pokemon (name, type)
      VALUES (?, ?)
    SQL

    # @db.execute(sql, self.name, self.type) # NoMethodError: undefined method `type' for Pokemon:Class
  end

  # def self.find(id, db) # undefined method `id' for nil:NilClass
  # def self.find(:id, db) #syntax error, unexpected tSYMBEG, expecting ')' (SyntaxError)
  # def self.find(id:, db) # syntax error, unexpected tIDENTIFIER
  def self.find(id, db)
  # def self.find(id:, db:) # wrong number of arguments (given 2, expected 0)

    # pok = db.execute("SELECT * FROM pokemon WHERE pokemon.id = id;")
    # binding.pry
    # id: = pok[0][0]
    # n = pok[0][1]
    # t = pok[0][2]
    # new_pokemon = Pokemon.new(id:, name:, type:, db:) # syntax error, unexpected ',' (SyntaxError)
    # new_pokemon = Pokemon.new # missing keywords: id, name, type, db
    # new_pokemon = Pokemon.new(id: pok[0][0], name: pok[0][1], type: pok[0][2], db:)
    @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
    # new_pokemon
  end
end
