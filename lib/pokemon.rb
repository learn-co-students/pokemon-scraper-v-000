class Pokemon

attr_accessor :db
attr_reader :name, :type, :id
  def initialize(id, name, type, db)
    @id = id
    @name = name
    @type = type
    @@db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?);",name, type)
  end

  def self.find(id, db)
    db.execute("SELECT * FROM pokemon WHERE id = ?",id)
  end
end
