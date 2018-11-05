class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    finder = db.execute("SELECT * FROM pokemon WHERE (id = ?)", id).flatten
    Pokemon.new(id: finder[0], name: finder[1], type: finder[2], db: db)
  end

end
