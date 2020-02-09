class Pokemon
attr_accessor :name, :type, :db, :id

def initialize(id:nil, name:, type:, db:)
  @id = id
  @name = name
  @type = type
  @db = db
end

def self.create
  sql = <<-SQL
    CREATE TABLE IF NOT EXISTS pokemon (
      id INTEGER PRIMARY KEY,
      name TEXT,
      type TEXT
    )
  SQL
@db.execute(sql)
end

def self.save(name, type, db)
  sql = <<-SQL
    INSERT INTO pokemon (name, type)
    VALUES (?, ?)
  SQL
db.execute(sql, name, type)
@id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
end

def self.delete
  sql = <<-SQL
    DROP TABLE pokemon
  SQL
@db.execute(sql)
end

def self.find(id_num, db) #finds a pokemon from the database by their id number and returns a new Pokemon object (FAILED - 1)
  sql = <<-SQL
      SELECT * FROM pokemon
      WHERE id =?
  SQL
  row = db.execute(sql, id_num).flatten
  self.new(id: row[0], name: row[1], type: row[2], db: db)
end

end
