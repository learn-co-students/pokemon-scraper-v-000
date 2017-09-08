class Pokemon
  @@all = []
  attr_accessor :name, :type, :db, :id, :hp
  def initialize(id = nil, name = nil, type = nil, db = nil)
    @name = name
    @type = type
    @db = db
    @id = id
    @hp ||= 60
    @@all << self
  end

  def alter_hp(new_hp, db)
    # binding.pry
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?",new_hp, @id)
    @hp = new_hp
  end

  def self.all
    @@all
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon(name, type) VALUES(?,?)",name, type)
  end

  def self.find(id, db)
    poke = db.execute("SELECT * FROM pokemon WHERE id = (?)",id).flatten
    id_poke = @@all.detect {|each_poke| each_poke.id == id}
    id_poke != nil ? id_poke : Pokemon.new(poke[0], poke[1], poke[2], db)
  end
end
