class Pokemon
  attr_accessor :name, :type, :db, :id 

 def initialize(id, name, type, db)
   @name = name 
   @type = type 
   @db = db 
   @id = id 
 end


 def self.save(name, type, db)
   ins = db.prepare("INSERT INTO pokemon(name, type) VALUES (?, ?)")
   ins.execute(name, type)
 end

 def self.find(id, db)
   x = db.execute("SELECT * FROM pokemon WHERE id = #{id}")
   x[0]
 end 






end
