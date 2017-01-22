class Pokemon
  @all = []
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)" ,name, type)
  end

  def self.find(id, db)
    Pokemon.new(id: db.execute("SELECT * FROM pokemon WHERE id=?", id).flatten[0], name: db.execute("SELECT * FROM pokemon WHERE id=?", id).flatten[1], type: db.execute("SELECT * FROM pokemon WHERE id=?", id).flatten[2], db: db)


  end

end
