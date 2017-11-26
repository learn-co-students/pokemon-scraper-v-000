class Pokemon

  attr_accessor :id, :name, :type, :db, :hp

  @@all = []

  def initialize(id:, name:, type:, hp: 60, db:)
    @id = id
    @name = name
    @type = type
    @hp =  hp
    @db = db
    @@all << self
  end

  def self.save(name, type, database_connection)
    pokemon = database_connection.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
    @@all << pokemon
  end

  def self.find(id, db)
    new_pokemon = db.execute("SELECT * FROM pokemon WHERE id= ?", id).flatten
    self.new(id: new_pokemon[0], name: new_pokemon[1], type: new_pokemon[2], hp: new_pokemon[3], db: db)
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
  end


end
