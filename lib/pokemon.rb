class Pokemon

  attr_accessor :id, :name, :type, :hp, :db

    @@all = []

  def initialize(opts)
    @id = opts[:id]
    @name = opts[:name]
    @type = opts[:type]
    @hp = opts[:hp]
    @db = opts[:db]
    @@all << self
  end

  def self.all
    @@all
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    found_pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    pokemon = Pokemon.new(id: found_pokemon[0], name: found_pokemon[1], type: found_pokemon[2], hp: found_pokemon[3], db: db)
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET HP = ? WHERE id = ?", hp, id)
  end
end
