class Pokemon
  attr_reader :id, :name, :type, :db
  
  def initialize(id, name, type, db)
    @id = id;
    @name = name
    @type = type
    @db = db
  end
  
  def self.save(name, type, db)
    sql = <<-SQL
      INSERT INTO 
        pokemon (name, type) 
      VALUES
        (?, ?);
    SQL
    
    db.execute(sql, name, type)
  end
  
  def self.find(id, db)
    sql = <<-SQL
      SELECT 
        id, name, type
      FROM 
        pokemon
      WHERE 
        id = ?;
    SQL
    
    db.execute(sql, id)
  end
  
end
