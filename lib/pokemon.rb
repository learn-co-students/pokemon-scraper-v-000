class Pokemon
  attr_accessor :name, :id, :type, :db, :hp

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
    x = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
    results = x.collect do |row|
      pokemon = Pokemon.new(name: row[1], type: row[2], db: db, id: id)
      pokemon
    end
    results[0]
  end
end
