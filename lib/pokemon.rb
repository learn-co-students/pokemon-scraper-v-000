class Pokemon
  require 'pry'
  attr_accessor :name, :id, :type, :db, :hp

  def initialize(id:, name:, type:, hp: nil, db:)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
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
    Pokemon.new(id: pokemon[0], name: pokemon[1], type: pokemon[2], hp: pokemon[3], db: db)
  end

  def alter_hp(new_hp, db)
    sql = <<-SQL
      UPDATE pokemon SET hp = ? WHERE id = ?
    SQL
    db.execute(sql, new_hp, self.id)
  end
end
