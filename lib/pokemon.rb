class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(name:, type:, db:, id:)
    @name = name
    @type = type
    @db = db
    @id = id
  
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    another_pokemon = db.execute("SELECT * FROM pokemon WHERE id=?", id).flatten
    p= Pokemon.new(id: another_pokemon[0], name: another_pokemon[1], type: another_pokemon[2], db:db)
    p
  end

end
