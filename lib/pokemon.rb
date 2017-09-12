class Pokemon

  attr_accessor :id, :type, :name, :db, :hp


 def initialize(id = nil, name = nil, type = nil, db)



   @id = id unless id == nil
   @type = type unless type == nil
   @name = name unless name == nil
   @db = db


 end
#binding.pry
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

def self.find(nid, ndb)
  poke1 = self.new(ndb)
  temp_new = []
  temp = ndb.execute("SELECT * FROM pokemon WHERE id = ?", nid)

#binding.pry
  poke1.id = temp[0][0]
  poke1.name = temp[0][1]
  poke1.type = temp[0][2]
  poke1.hp = temp[0][3]
  poke1

end
def alter_hp(new_hp, db)

  db.execute("UPDATE pokemon SET hp = ? WHERE id = ?",new_hp, @id)

end

end
