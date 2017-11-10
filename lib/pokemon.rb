class Pokemon

  attr_accessor :id, :name, :type, :db

  def initialize(id, name, type, db)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    sql = <<-SQL
    INSERT INTO pokemon (name, type) VALUES (?, ?);
    SQL

    db.execute(sql, [name, type])
    # results = DB[:conn].execute
  end

  def self.find(id, db)
    sql = <<-SQL
    SELECT * FROM pokemon WHERE id = (?);
    SQL

    pokemon = db.execute(sql, [id])
    Pokemon.new(id, pokemon[1], pokemon[2], db)
  end


end
