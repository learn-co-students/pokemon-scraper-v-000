class Pokemon
  attr_accessor :name, :type, :db
  def initialize(id=1, name,type,db)
    @id = id
    @name = name
    @type = type
    @db = db
  end
  
  def self.save(name, type, db) 
    db.execute( "INSERT INTO pokemon ( name, type ) VALUES ( ?, ? )", [name, type])
  end
  
  def self.find(id, db)
    db.get_first_row( "SELECT * FROM pokemon" )
  end
end
