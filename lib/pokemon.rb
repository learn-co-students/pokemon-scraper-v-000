class Pokemon
  attr_accessor :id, :name, :type, :db
  def initialize(id = nil, name = nil, type = nil, db)
    @db = db
    @name = name
    @type = type
    @id = id
  end

  def self.save(name, type, db)
    id = db.execute("select max(id) from pokemon")[0]
    id = id.nil? ? id + 1 : 1
    s = db.prepare("insert into pokemon (id, name, type) values (?, ?, ?)")
    s.execute([id, name, type])
  end

  def self.find(id, db)
    data = db.execute("select * from pokemon where id = ?", [id])[0]
    new(id, data[1], data[2], db)
  end
end
