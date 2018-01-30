class Pokemon
  attr_accessor :id,:name,:type,:db,:hp

  def initialize(id:, name:, type:, db:, hp: nil)
    self.id = id
    self.name = name
    self.type = type
    self.db = db
    self.hp = hp
  end

  def self.save(name, type, db)
   db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?);", [name, type])
  end

  def self.find(id, db)
    pokemon_attr = db.execute("SELECT * FROM pokemon WHERE id = ?",id)
    self.new(id: pokemon_attr.first[0], name: pokemon_attr.first[1], type: pokemon_attr.first[2], db: db, hp: pokemon_attr.first[3])
  end

  def alter_hp(new_hp,db)
    self.hp = new_hp
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?",self.hp,self.id)
  end

end
