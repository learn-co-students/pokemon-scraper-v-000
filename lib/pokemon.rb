require 'pry'

class Pokemon

  attr_accessor :name, :type, :db, :id

  def initialize(name:, type:, db:, id: nil)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    sql = <<-SQL
      INSERT INTO pokemon
      VALUES (?,?,?)
    SQL

    db.execute(sql, nil, name, type)
    @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
  end

  def self.create_from_db(row)
    pokemon = Pokemon.new(name: row[1], type: row[2], db: @db, id: row[0])
  end

  def self.find(id, db)
    sql = <<-SQL
      SELECT *
      FROM pokemon
      WHERE id = ?
    SQL

    db.execute(sql, id).map do |row|
      self.create_from_db(row)
    end.first
  end

end
