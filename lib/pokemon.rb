class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize (id, name, type, database)
    @id = id
    @name = name
    @type = type
    @db = database
  end

  def self.save(name, type, database)
    sql = <<-SQL
      INSERT INTO pokemon (name, type) VALUES (?, ?)
    SQL

    database.execute(sql, name, type)
  end

  def self.find(id, database)
    sql = <<-SQL
      SELECT * FROM pokemon WHERE pokemon.id = ?
    SQL

    database.execute(sql, id)
  end

end
