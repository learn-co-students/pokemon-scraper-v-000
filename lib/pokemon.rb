class Pokemon

 attr_accessor :id, :name, :type, :db

 def initialize(id, name=nil, type=nil, hp=nil, db=nil)
  @id = id
  @name = name
  @type = type
  @hp = hp
  @db = db
 end

 def self.save(name, type, hp, db)
  db.execute("INSERT INTO pokemon (name, type, hp) VALUES (?, ?, ?)", name, type, hp)
 end
     #Pokemon
 def self.find(id_num, db)
   pokemon_s = db.execute("SELECT * FROM pokemon WHERE pokemon.id=?", id_num).flatten
   Pokemon.new(id = pokemon_s[0], name = pokemon_s[1], type = pokemon_s[2], hp = pokemon_s[3], db = db)
 end




end
