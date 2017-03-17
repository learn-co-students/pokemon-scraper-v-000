require 'pry'
class Pokemon
attr_accessor :id, :name, :type, :db

def initialize(obj)
  @id = obj[:id]
  @name = obj[:name]
  @type = obj[:type]
  @db = obj[:db]

end

def self.save(name,type,db)
   db.execute("INSERT INTO pokemon(name,type) VALUES(?,?)",name,type )
end

def self.find(p_id,db)
result_array = db.execute("SELECT * FROM pokemon WHERE id = ?" ,p_id)
  obj = {}
  obj[:id] = result_array[0][0]
 obj[:name] = result_array[0][1]
 obj[:type] = result_array[0][2]
 self.new(obj)
end

def alter_hp(hp,db)
 db.execute("ALTER TABLE pokemon ADD COLUMN hp int")
 db.execute("UPDATE pokemon SET hp = ?",60)
end

end
