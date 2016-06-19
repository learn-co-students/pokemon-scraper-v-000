class Pokemon

  attr_accessor :id, :name, :type, :db

  @@all = []
  def initialize(id, name, type, db)
    @id = id
    @name = name
    @type = type
    @db = db 
    @@all << self
  end

  def self.find_id(name)
    @@all.detect {|pokemon| pokemon.name == name}.id
  end

  def self.save(name, type, db)
    id = Pokemon.find_id(name)
    db.execute("INSERT INTO pokemon (id, name, type) VALUES (?, ?, ?)", id, name, type)
  end

  def self.find(id, db)
    db.execute("SELECT * FROM pokemon WHERE id = ?", id)
  end

  def alter_hp(new_hp)
    self.db.execute("UPDATE pokemon SET hp = ?", new_hp)
  end


end
