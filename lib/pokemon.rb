class Pokemon
  attr_reader :id, :name, :type, :db
  @@all = []

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
    @@all << self
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    new_pokemon = db.execute("SELECT * FROM pokemon WHERE id= ? ", id).flatten
    self.new(id: new_pokemon[0], name: new_pokemon[1], type: new_pokemon[2], db: db)
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, id).flatten[0]
  end

 def hp
   db.execute("SELECT hp FROM pokemon WHERE id = ?", id).flatten[0]
 end

 end
