require 'pry'
class Pokemon

  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, db:, hp: nil)
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db
  end

  def self.save(name, type, db)
    sql = <<-SQL
    INSERT INTO pokemon(name, type)
    VALUES(?, ?)
    SQL

    db.execute(sql, name, type)
  end

  def self.find(id, db)
    sql = <<-SQL
    SELECT *
    FROM pokemon
    WHERE id = ?
    SQL

    row = db.execute(sql, id)[0]
    Pokemon.new(id: row[0], name: row[1], type: row[2], hp: row[3] ,db: db)
  end

  def alter_hp(new_hp, db)
    sql = <<-SQL
      UPDATE pokemon
      SET hp = ?
      WHERE id = ?
      SQL

    db.execute(sql, new_hp, self.id)
  end


end
