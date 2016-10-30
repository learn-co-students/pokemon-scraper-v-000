class Pokemon
  attr_accessor :id, :name, :type, :db, :hp
  @@all = []

  def initialize(id:, name:, type:, hp: nil, db:)
   @id = id
   @name = name
   @type = type
   @hp = hp
   @db = db
   @@all << self
 end

 def self.find(id, db)
   pokemon_char = db.execute("SELECT * FROM pokemon WHERE id=?", id).flatten
   Pokemon.new(id: pokemon_char[0], name: pokemon_char[1], type: pokemon_char[2], hp: pokemon_char[3], db: db)
 end

  def self.all
    @@all
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type)
      VALUES (?, ?)",name, type)
  end

  def alter_hp(hp_new, db)
    db.execute("UPDATE pokemon SET hp=? WHERE id=?", hp_new, self.id)
  end
end
