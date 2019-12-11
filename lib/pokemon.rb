class Pokemon
  
  attr_accessor :id, :name, :type, :db
  
  def initialize(id = nil, name, type, db)
    @id = id
    @name = name
    @type = type
    @db = db
  end
  
  def self.save 
    sql = <<-SQL
    INSERT INTO pokemon (name, type)
    VALUES (?, ?)
    SQL
    DB[:conn].execute(sql, self.name, self.type)
    @id = DB[:conn].execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
  end
  
  def self.find(id)
    sql = "SELECT * FROM pokemon WHERE id = ?"
    result = DB[:conn].execute(sql, id)[0]
    Student.new(result[0], result[1], result[2])
  end
end
