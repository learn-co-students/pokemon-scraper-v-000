require 'pry'
class Pokemon
  attr_accessor :name, :type, :db
  attr_reader :id


  def initialize(id:, name:, type:, db:)
    @name = name
    @type = type
    @db = db
    @id = id
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
    SELECT * FROM pokemon WHERE id = ?
    SQL
    x = db.execute(sql,id)
    x = x.flatten

    Pokemon.new(id: x[0],name: x[1],type: x[2],db: db)
  end
end
    
