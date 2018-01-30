class Pokemon
  attr_accessor :id, :name, :type, :db

 def initialize(id, name, type, db)
    @name = name
    @type = type
    @db = db
  end 


  def self.save(name, type, db)
    insert = db.prepare('INSERT INTO pokemon (name, type) VALUES (?,?)')
    insert.execute(name, type)
  end

  def self.find(id, db)
    results = []
    query = db.prepare('SELECT * FROM pokemon WHERE id=?')
    results << query.execute(id).first
  end


end
