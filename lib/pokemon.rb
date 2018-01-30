require 'pry'
class Pokemon
  attr_accessor :id,:name,:type,:db, :hp
  def initialize(id:,name:,type:,db:, hp: 60)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp if hp
    #binding.pry
  end
  def alter_hp(hp,db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp,id)
  end
  def self.save(name,type,db)
    #binding.pry
    db.execute("INSERT INTO pokemon (name,type) VALUES (?, ?)",name, type)
   end
  def self.find(id,db)
    data = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    self.new( id: data[0],name: data[1], type: data[2], db: db, hp: data[3])
  end
end
