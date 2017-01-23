class Pokemon
  attr_accessor :name, :type, :db, :id

  def initialize(id = nil, name = nil, type = nil, db = nil)
    @name = name
    @type = type
    @db = db
    @id = id
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id_number, db)
    instance = db.execute("SELECT * FROM pokemon WHERE id = ?", id_number).flatten
    Pokemon.new(id = instance[0], name = instance[1], type = instance[2], db = db)
  end

end
