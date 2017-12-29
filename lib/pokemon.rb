class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, db:)
    @name = name
    @type = type
    @db = db
    @id = id
  end

  def self.find(id, db)
    id, name, type = db.execute("select * from pokemon where id = ?", id).first
    self.new(id: id, name: name, type: type, db: db)
  end
 
  def self.save(name, type, database_connection)
    database_connection.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

end
