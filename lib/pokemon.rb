class Pokemon
  attr_accessor :num, :name, :type, :db
  
  def initialize(num,name,type,db)
    @name = name
    @num = num
    @type = type
    @db = db
  end

  def self.save(name,type,db)
    ins = db.prepare('INSERT INTO pokemon (name,type) VALUES (?,?)')
    ins.execute(name,type)
  end

  def self.find(id, db)
    db.execute("SELECT id, name, type FROM pokemon WHERE id = ?",id).flatten
  end
end

