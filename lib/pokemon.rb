class Pokemon

attr_accessor :id, :name, :type, :db, :hp

  # def initialize(id:, name:, type:, db:) #passes
  def initialize(name:, type:, db:, id:, hp: nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
    sql = <<-SQL
      INSERT INTO songs pokemon (name, type)
      VALUES (?, ?)
    SQL
  end

  def self.find(id, db)
    pokemon_row = db.execute("SELECT * FROM pokemon where pokemon.id = id")
    pokemon_from_db = Pokemon.new(name: pokemon_row[0][1], type: pokemon_row[0][2], db: db, id: pokemon_row[0][0], hp: pokemon_row[0][3])
    pokemon_from_db
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
  end
end
