class Pokemon

 attr_accessor :id, :name, :type, :hp, :db

 def initialize(id, name=nil, type=nil, hp=nil, db=nil)
  @id = id
  @name = name
  @type = type
  @hp = hp
  @db = db
 end

 def self.save(name, type, db)
  db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
 end
     #Pokemon
 def self.find(id_num, db)
   pokemon_s = db.execute("SELECT * FROM pokemon WHERE pokemon.id=?", id_num).flatten
   Pokemon.new(id = pokemon_s[0], name = pokemon_s[1], type = pokemon_s[2], hp = pokemon_s[3], db = db)
 end

 def alter_hp(hp, db)
  hp_low = db.execute("UPDATE pokemon SET hp = ? WHERE pokemon.id = ?", hp, self.id)

 end




end
