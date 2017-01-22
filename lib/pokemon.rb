class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id = nil, name = nil, type = nil, db = nil, hp = nil)
   @name = name
   @type = type
   @db = db
   @id = id
   @hp = hp
  end
  def self.save(name, type, db)
   db.execute("INSERT INTO pokemon(name, type) VALUES(?,?)", name, type)
 end

 def self.find(id, db)
   instance = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
   Pokemon.new(id = instance[0], name = instance[1], type = instance[2], hp =instance[3], db = db)
 end

end
