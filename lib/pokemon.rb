require "pry"
class Pokemon

  attr_accessor :db,:name,:type,:id,:hp

  @@all = []
  def initialize (id:,name:,type:,db:,hp: 60)   #key argument. Decent explanation here https://medium.com/@tyler_brewer2/utilizing-ruby-keyword-arguments-462ba8366483
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db
  end

  def self.save(name,type,db)
    ins = db.prepare("INSERT INTO pokemon (name,type) VALUES (?, ?)")
    ins.execute(name,type)

  #  ins = db.execute.("INSERT INTO pokemon (name,type) VALUES (?, ?)", name, type) is the same that above.
  end

  def self.find(id,db)
    arr = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    Pokemon.new(id: arr[0],name: arr[1], type: arr[2], db: db, hp: arr[3])

  end

  def alter_hp(val,db)

    # array1 = db.execute("SELECT * FROM pokemon").flatten
    id = self.id

    # result = db.execute("UPDATE Pokemon SET hp = \"#{val}\" WHERE id = ?",id).flatten
    result = db.execute("UPDATE Pokemon SET hp = ? WHERE id = ?",val,id).flatten
  end


end
