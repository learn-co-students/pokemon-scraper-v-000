class Pokemon
  attr_accessor :name, :type, :db

  def initialize(id, name, type, db)
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    ins = db.prepare("INSERT INTO pokemon (name,type) VALUES (?, ?)")
    ins.execute(name,type)
  end

  def self.find(id, db)
    db.execute("SELECT * FROM pokemon WHERE pokemon.id = id;").flatten
  end
end
