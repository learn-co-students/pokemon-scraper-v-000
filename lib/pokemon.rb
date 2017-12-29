class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, db:, hp: nil)
    @name = name
    @type = type
    @db = db
    @id = id
    @hp = hp
  end

  def self.find(id, db)
    id, name, type, hp = db.execute("select * from pokemon where id = ?", id).first
    self.new(id: id, name: name, type: type, db: db, hp: hp)
  end
 
  def self.save(name, type, database_connection)
    database_connection.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ? ", hp, self.id)
  end

#   UPDATE table_name
# SET column1 = value1, column2 = value2, ...
# WHERE condition;

end
