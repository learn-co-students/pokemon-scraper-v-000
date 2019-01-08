class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, db:, hp:60)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(name, type, db)
    insert = db.prepare("INSERT INTO pokemon (name, type) VALUES (?, ?)")
    insert.execute(name, type)
  end

  def self.find(id, db)
    pokemon_arr = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    Pokemon.new(id: pokemon_arr[0],
      name: pokemon_arr[1],
      type: pokemon_arr[2],
      hp: pokemon_arr[3],
      db: db)
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, self.id)
  end


end
