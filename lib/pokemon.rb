class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  # database_connection = SQLite3::Database.new('db/pokemon.db')

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.new_with_hp(id:, name:, type:, db:)
    pokemon = Pokemon.new(id: id, name: name, type:type, db: db)
    pokemon.hp = db.execute("SELECT hp FROM pokemon WHERE id = ?", id).flatten.first

    pokemon
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    poke_array = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten

    if poke_array.length == 3
      pokemon = Pokemon.new(id: poke_array[0], name: poke_array[1], type: poke_array[2], db: db)

    elsif poke_array.length == 4
      pokemon = Pokemon.new_with_hp(id: poke_array[0], name: poke_array[1], type: poke_array[2], db: db)
    end

    binding.pry
    pokemon

  end


  def alter_hp(new_hp, db)
    self.hp = db.execute("SELECT hp FROM pokemon WHERE id = ?", self.id).flatten.first

    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
    self.hp = db.execute("SELECT hp FROM pokemon WHERE id = ?", self.id).flatten.first

    self.hp

  end


end
