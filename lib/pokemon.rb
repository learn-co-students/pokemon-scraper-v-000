class Pokemon
  @@all = []
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id = nil, name = nil, type = nil, db = nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp ||= 60
    @@all << self
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon(name, type) VALUES(?,?)",name, type)
  end

  def self.all
    @@all
  end

  def self.find(id, db)
      poke = db.execute("SELECT * FROM pokemon WHERE id = (?)",id).flatten
      id_poke = @@all.detect {|each_poke| each_poke.id == id}
      id_poke != nil ? id_poke : Pokemon.new(poke[0], poke[1], poke[2], db)
    end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?",new_hp, @id)
    @hp = new_hp
  end



end
