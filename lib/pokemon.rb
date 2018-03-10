class Pokemon
  attr_accessor :name, :type, :db
  attr_reader :id

  @@all = []

  def initialize(pokemon)
    @id = pokemon[:id]
    @name = pokemon[:name]
    @type = pokemon[:type]
    @db = pokemon[:db]
    @@all << self
    pokemon
  end

  def self.all
    @@all
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon(name,type) VALUES (?, ?)" ,name, type)
  end

  def self.find(id, db)
    id = db.execute("SELECT id FROM pokemon WHERE id = #{id}").flatten[0]
    name = db.execute("SELECT name FROM pokemon WHERE id = #{id}").flatten[0]
    type = db.execute("SELECT type FROM pokemon WHERE id = #{id}").flatten[0]

    pokemon_hash = {id: id, name: name, type: type, db: db}
    Pokemon.new(pokemon_hash)
  end


end
