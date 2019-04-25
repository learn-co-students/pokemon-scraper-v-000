class Pokemon
  attr_accessor :name, :type, :db, :id, :hp
  
  def initialize(name:, type:, db:, id:, hp: 60)
    @name = name
    @type = type
    @db = db
    @id = id
    @hp = hp
  end
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end
  
  def self.find (id_num, db)
    pokemon_info = db.execute("SELECT * FROM pokemon WHERE id = ?", id_num).flatten
    Pokemon.new(id:pokemon_info[0], name: pokemon_info[1], type: pokemon_info[2], hp: pokemon_info[3],db: db)
  end
  
  #def alter_hp(hp, db)
    #db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, self.id)
  #end
end
