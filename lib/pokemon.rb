class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  @@all = []

  def initialize(id:, name:, type:, db:, hp: nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
    @@all << self
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?);", name, type)
  end

  def self.find(id, db)
    pokemon = db.execute("SELECT name, type FROM pokemon WHERE id = #{id};")
    Pokemon.new(id: id, name: pokemon[0][0], type: pokemon[0][1], db: db)
    # binding.pry

  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = #{hp} WHERE id = #{self.id};")
    # binding.pry
    self.hp = hp
    
  end
end
