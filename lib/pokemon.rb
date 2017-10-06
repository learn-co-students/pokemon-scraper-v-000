class Pokemon

  attr_accessor :id, :name, :type, :db

  @@all = []

  def initialize(name: name, type: type, id: id, db: db)
    @name = name
    @type = type
    @id = id
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name,type) VALUES (?,?);", name,type)
  end

  def self.all
    @@all
  end

  def self.find(id, db)
    data = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    Pokemon.new(id: data[0], name: data[1], type: data[2], db: db)
  end




end
