class Pokemon

  attr_accessor :id, :name, :type, :db
  
  def initialize(id, name, type, db)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    sql = db.prepare("insert into pokemon (id, name, type) values (?, ?, ?)")
    sql.execute(@id, name, type)
  end

  def self.find(id, db)
    db.execute("select * from pokemon where id=?", id)
  end

end
