class Pokemon
  attr_accessor :id, :name, :type, :db, :hp
  @@all = []

  def initialize (id: id, name: name, type: type, db: db, hp: nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
    @@all << self
  end

  def self.all
    @@all
  end

   def self.save(name, type, db)
     db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
   end

   def self.find(id, db)
     new_pokemon = db.execute("SELECT * FROM pokemon WHERE pokemon.id = id")[0]
     Pokemon.new(id: new_pokemon[0], name: new_pokemon[1], type: new_pokemon[2], db: db, hp: 60)
   end

end
