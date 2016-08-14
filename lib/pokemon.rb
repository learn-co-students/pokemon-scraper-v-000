class Pokemon
  attr_accessor :id, :name, :type, :db, :hp
  @@all = []

  def initialize(id, name, type, db, hp = nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
    @@all << self
  end

  def self.all
    @@all
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(id, name)
    db.execute('SELECT * FROM pokemon WHERE id == id ?', id)
    # array = []
    # self.all.detect do |pokemon|
    #    id == pokemon.id || name == pokemon.name
    #     array << [pokemon.id, pokemon.name, pokemon.type]
    # end
    # array
  end

  def self.alter_hp(id, new_health, db)
    db.execute('UPDATE pokemon SET hp = ? WHERE id = ?', new_health, id)
    # binding.pry
  end

end
