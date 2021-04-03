

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
      id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
     
  end

  

  def self.find(id, db)
    sql = <<-SQL
      SELECT *
      FROM pokemon
      WHERE id = ?
    SQL

      row = db.execute(sql, id)[0]
        new_pokemon = self.new(id: row[0], name: row[1], type: row[2], db: row[3])
    
    #   binding.pry
  end
end

