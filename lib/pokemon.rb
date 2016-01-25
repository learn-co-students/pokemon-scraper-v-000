class Pokemon
  attr_accessor :name, :type, :db

  def initialize(name, type, db, poke)
    @name = name
    @type = type
    @db = db
    @poke = poke
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO Pokemon (name, type) VALUES (?,?)",name, type)
  end

  def self.find(type, db)
    db.execute("SELECT * FROM Pokemon WHERE type = 'fire'").flatten
  end

end
