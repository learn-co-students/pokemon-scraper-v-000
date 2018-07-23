require 'pry'

class Pokemon
  
  attr_accessor :id, :name, :type, :db, :hp
  
  def initialize(id:, name:, type:, db:, hp:nil)
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db
  end
 
  def self.save(name, type, db)
    sql = "INSERT INTO pokemon (name, type) VALUES (?,?)"
    db.execute(sql, name, type)
  end

  def self.find(id, db)
    sql = "SELECT * from pokemon where id = ?"
    result = db.execute(sql, id)
    name = result[0][1]
    type = result[0][2]
    hp = result[0][3]
    self.new(id: id, name: name, type: type, hp: hp, db: db)
  end

  def alter_hp(hp, db)
    sql = "UPDATE pokemon SET hp = ? WHERE name = ?"
    db.execute(sql, hp, self.name)
  end
    
end
