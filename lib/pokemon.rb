class Pokemon
  attr_accessor :id, :name, :type, :hp, :db

  @@all = []

  def initialize(args)
    @id = args[:id]
    @name = args[:name]
    @type = args[:type]
    @hp = args[:hp]
    @db = args[:db]
    @@all << self
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", [name, type])
  end

  def self.find(id, db)
    array = db.execute("SELECT * FROM pokemon WHERE pokemon.id = (?)", [id])
    p = {}
    p[:id] = array[0][0]
    p[:name] = array[0][1]
    p[:type] = array[0][2]
    p[:hp] = array[0][3]
    p[:db] = db
    Pokemon.new(p)
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = (?) WHERE pokemon.id = (?)", [hp, @id])
  end
end
