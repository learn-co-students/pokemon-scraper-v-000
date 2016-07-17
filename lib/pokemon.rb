class Pokemon
  attr_accessor :id, :name, :type, :hp, :db

  @@all = []

  def initialize(id,name,type,db)
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db
  end

  def self.all
    @@all
  end

  def self.save(name,type,db)
    db.execute("INSERT INTO pokemon (name,type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    db.execute("SELECT id,name,type FROM pokemon WHERE id = ?", id)
  end
end
