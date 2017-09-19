class Pokemon

  attr_accessor :name, :type, :db, :hp
  attr_reader :id

  @@all = []

  def initialize(pokemon_hash)
    @id = pokemon_hash[:id]
    @name = pokemon_hash[:name]
    @type = pokemon_hash[:type]
    @db = pokemon_hash[:db]
    @@all << self
  end

  def self.save(name, type, db)
      db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    if self.all.empty?
      self.create_pokemon(id, db)
    else
      pokemon = self.all.detect { |pokemon| pokemon.id == id }
      pokemon == nil ? self.create_pokemon(id, db) : pokemon
    end

  end

  def self.create_pokemon(id, db)
    pokemon = {id: id, db: db}

    pokemon_arr = db.execute("SELECT name, type FROM pokemon WHERE id = ?", id).flatten
    pokemon[:name] = pokemon_arr[0]
    pokemon[:type] = pokemon_arr[1]
    self.new(pokemon)
  end

  def alter_hp(hp, db)
    id = self.id
    db.execute("UPDATE pokemon Set hp = ? WHERE id = ?", hp, id)
    self.hp = hp
  end

  def self.all
    @@all
  end


end
