class Pokemon
  attr_accessor :id, :name, :type, :db, :hp
  @@all = []
  def initialize(attributes)
    attributes.each {|key, value| self.send(("#{key}="), value)}
    #@id = id
    #@name = name
    #@type = type
    #@db = db
    #@hp = 60
  end
  def self.save(name,type,db)
    db.execute("INSERT INTO pokemon (name,type) VALUES (?, ?)",name,type)
  end
  def self.find(id,db)
    record=db.execute("select * from pokemon where id = (?)",id)
    Pokemon.new(id: record[0][0],name: record[0][1], type: record[0][2], db: db, hp: record[0][3])
  end
  def alter_hp(newhp,db)

    db.execute("update pokemon set hp = ? where id = ?",newhp,self.id)
    #binding.pry
  end

end
