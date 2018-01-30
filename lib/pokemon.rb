class Pokemon
  attr_accessor :id, :name, :type, :db, :hp
  @@all = []

  def initialize(options = {})
    @id = options[:id]
    @name = options[:name]
    @type = options[:type]
    @db = options[:db]
    @hp = options[:hp]
    @@all << self
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", id)[0]
    self.new({id: pokemon[0], name: pokemon[1], type: pokemon[2], hp: pokemon[3], db: db})
  end

  def alter_hp(hp, db)
    @hp = hp
    db.execute("UPDATE pokemon SET hp = ?", hp)
  end
end
