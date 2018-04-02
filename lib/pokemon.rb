class Pokemon
  attr_accessor :name, :type, :db, :id

  @@all = []

  def initialize(pokemon)
    @id = pokemon[:id]
    @name = pokemon[:name]
    @type = pokemon[:type]
    @db = pokemon[db]
    @@all << self
  end

  def self.all
    @@all
  end

  def self.save(name, type, database)
    database.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    poke = db.execute("SELECT * FROM pokemon WHERE id = #{id}")

    new_poke = {}
    new_poke[:id] = poke[0][0]

    new_poke[:name] = poke[0][1]

    new_poke[:type] = poke[0][2]

    Pokemon.new(new_poke)

  end


end
