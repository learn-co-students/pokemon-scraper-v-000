class Pokemon
  attr_accessor :id, :name, :type, :db
  @@all = []

  def self.all
    @@all
  end
  
  def initialize (id, name, type, db)
    @id = id
    @name = name
    @type = type
    @db = db
    @@all << self
  end

  def self.save(name,type,db)
    db.execute("INSERT INTO pokemon (name,type) VALUES (?,?)",name,type)
  end

  def self.find(id,db)
    db.execute("SELECT * FROM Pokemon WHERE id= ?",id).first
  end

end
