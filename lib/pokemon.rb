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

  def self.create_table
    sql = <<-SQL
      CREATE TABLE IF NOT EXISTS pokemon (
        id INTEGER PRIMARY KEY,
        name TEXT,
        type TEXT
      )
      SQL

      @db.execute(sql)
  end

  def self.drop_table
    sql = <<-SQL
      DROP TABLE IF EXISTS pokemon
      SQL

      @db.execute(sql)
  end

  def save
    if self.id
      self.update
    else
      sql = <<-SQL
        INSERT INTO pokemon (name, type)
        VALUES (?, ?)
      SQL

      @db.execute(sql, self.name, self.type)
      @id = @db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
    end
  end

  def self.create(name:, type:)
    pokemon = Pokemon.new(name, type)
    pokemon.save
    pokemon 
  end

  def update
    sql = <<-SQL
      UPDATE pokemon SET name = ?, type = ?
      WHERE id = ?
      SQL

      @db.execute(sql, self.name, self.type, self.id)
  end

end
