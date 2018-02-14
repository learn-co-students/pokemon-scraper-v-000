class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, db:, hp: = 60)
    @id = id
    @name = name
    @type = type
    @db = id, name, type, hp, db
    @hp = hp
  end


  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
  end


  def self.find(id_num,db)
    pokemon_stats = db.execute("SELECT * FROM pokemon WHERE id=?",id_num).flatten
    Pokemon.new(id: pokemon_stats[0], name: pokemon_stats[1], type: pokemon_stats[2], db: db, hp: pokemon_stats[3])
  end



end
