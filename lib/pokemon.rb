class Pokemon

  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, hp: 60, db:)
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", [name, type])
  end

  def self.find(id, db)
  object = db.execute("SELECT * FROM pokemon WHERE id=?", id).flatten
  Pokemon.new(id: object[0], name: object[1], type: object[2], db: db)
  end

end
