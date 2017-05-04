require 'pry'
class Pokemon
  attr_accessor :id,:name,:type,:db
  def initialize(id:,name:,type:,db:, hp: 60)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end
  def self.save(name,type,db)
    db.execute("INSERT INTO pokemon (name,type) VALUES (?, ?)",name, type)
   end
  def self.find(id,db)
    data = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
    self.new( id: data[0][0],name: data[0][1], type: data[0][2], db: db, hp: data[0][3])
  end
end
