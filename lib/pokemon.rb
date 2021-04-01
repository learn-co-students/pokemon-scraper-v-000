require_relative "../bin/environment.rb"
require_relative "../bin/sql_runner.rb"

class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
      sql = <<-SQL
        INSERT INTO pokemon (name, type)
        VALUES (?, ?)
      SQL
      db.execute(sql, name, type)
      @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
  end

#   def self.new_from_db(row)
#     new_pokemon = self.new(row[0], row[1], row[2], row[3])
    
#   end

  def self.find(id, db)
    sql = <<-SQL
      SELECT *
      FROM pokemon
      WHERE id = ?
      SQL

      row = db.execute(sql, id)
      binding.pry
  end

 

end
