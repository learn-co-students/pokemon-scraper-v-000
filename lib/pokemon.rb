class Pokemon
  attr_accessor :id, :name, :type, :db
  database_connection = SQLite3::Database.new('db/pokemon.db')
  @@all = []

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
    @@all << self
  end

  def self.all
    @@all
  end

  def self.save(name, type, db)
    sql = "INSERT INTO pokemon(name, type) Values(?, ?)"
    db.execute(sql, name, type)
  end

  def self.find(id, db)
    sql = "SELECT * FROM pokemon WHERE id = ?"
    row = db.execute(sql, id).flatten
    Pokemon.new(id: row[0], name: row[1], type: row[2], db: db)
  end


end
