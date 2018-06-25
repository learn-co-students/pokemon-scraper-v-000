class Pokemon
  attr_accessor :id, :name, :type, :db, :hp
  @@all = []

def initialize(id:, name:,hp: nil, type:, db:)
  @id = id
  @name = name
  @type = type
  @db = db
  @hp = hp
  @@all<< self

end


def self.save(name, type, db)
  db.execute("INSERT INTO pokemon(name, type) VALUES(?,?)",name, type)


end

def self.find(id, db)
  pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
  id = pokemon[0]
  name= pokemon[1]
  type= pokemon[2]
  hp = pokemon[3]
  new_pokemon = Pokemon.new(id:id,name:name,hp: hp, type:type,db:db)

end

def alter_hp(hp,db)
  pokemon = db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, @id)

end

end
