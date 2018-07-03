class Pokemon

  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, hp: nil, db:)
    @id   = id
    @name = name
    @type = type
    @hp   = hp
    @db   = db
  end

   def self.save(name, type, db)
     db.execute("INSERT INTO pokemon (name,type) VALUES (?, ?)", name, type)
   end

   def self.find(id, db)
     pokemon = db.execute("SELECT * FROM pokemon WHERE pokemon.id = id")[0]
     pikachu = Pokemon.new(id: pokemon[0], name: pokemon[1],type: pokemon[2],hp: pokemon[3],db: db)
     pikachu
   end

  #  def alter_hp(hp, db)
  #    db.execute("UPDATE pokemon SET hp = @hp", hp)
  #  end
end
