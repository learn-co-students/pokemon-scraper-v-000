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

  # def self.find(id, db)
  #   sql = <<-SQL
  #   SELECT * FROM pokemon WHERE id = ?
  #   SQL
  #   x = db.execute(sql, id)
  #   x = x.flatten
  #   Pokemon.new(x)
  #   x.id =
  #
  # end

  def self.find(id, db)
   sql = <<-SQL
     SELECT * FROM pokemon WHERE id = (?);
   SQL
   pokemon = db.execute(sql, [id]).flatten
   Pokemon.new(id, pokemon[1], pokemon[2], pokemon[3], db )
  end
  # def self.find(id, db)
  #   sql = <<-SQL
  #   SELECT * FROM pokemon WHERE id = ?
  #   SQL
  #   x = db.execute(sql,id)
  #   x = x.flatten
  #   Pokemon.new(id, x[1], x[2], x[3])

    # id = x[0]
    # name = x[1]
    # type = x[2]
    # db = x[3]
    # return x


end
