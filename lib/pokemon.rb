class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, db:, hp: nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon(name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", id)[0]
    self.new(id: pokemon[0], name: pokemon[1], type: pokemon[2], db: db, hp: 60)
  end

end
