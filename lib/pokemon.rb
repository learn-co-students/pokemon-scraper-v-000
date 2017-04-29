class Pokemon
  attr_accessor :id,:name,:type,:db,:hp
  def initialize(id:,name:,type:,db:,hp: 60)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def alter_hp(hp,db)
    db.execute("UPDATE pokemon SET hp=(?) WHERE id=(?)",hp,self.id)
  end

  def self.save(name,type,db)
    db.execute("INSERT INTO pokemon (name,type) VALUES (?,?)",name,type)
  end

  def self.find(id,db)
    pokemon_from_db = db.execute("SELECT * FROM pokemon WHERE id = (?)",id)
    self.new(id: pokemon_from_db[0][0],name: pokemon_from_db[0][1],type: pokemon_from_db[0][2],db: db,hp: pokemon_from_db[0][3])
  end
end
