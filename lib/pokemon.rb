class Pokemon
  attr_accessor :name, :type, :db, :id

  def initialize(name, type, db=SQLite3::Database.new('db/pokemon.db'), id)
    @name = name
    @type = type
    @db = db
    @id = id
  end

  def self.save(name, type, db)
    ins = db. prepare("INSERT INTO pokemon(name, type) VALUES (?, ?)")
    ins.execute(name, type)
  end

  def self.find(id, db)
    db.execute("SELECT id, name, type FROM pokemon WHERE id = ?", id).flatten 
  end

end
