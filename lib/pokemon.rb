class Pokemon

  attr_accessor :id, :name, :type, :db

  @@all = []

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
    @@all << self
  end

  def self.all
    @@all
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
  end

  def self.find(id, db)
    instance = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten

    id = instance[0]
    name = instance[1]
    type = instance[2]

    self.new(id:id, name:name, type:type, db:db)
  end
end
