class Pokemon
  attr_accessor :name, :type, :db, :id, :hp
  @all = []
  def initialize(name:,type:,db:, id:, hp:nil)
    @name, @type, @db, @id, @hp = name, type, db, id, hp
  end
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?);",name,type)
  end
  def self.find(id2,db)
    found = db.execute("SELECT * FROM pokemon WHERE id=?;",id2).flatten
    Pokemon.new(id:found[0],name:found[1],type:found[2],hp:found[3],db:db)
  end
  def alter_hp(hp2,db)
    db.execute("UPDATE pokemon SET hp=? WHERE id=?;",hp2,self.id)
  end
end
