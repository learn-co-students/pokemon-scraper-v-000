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
    new_entry = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    Pokemon.new(id: new_entry[0], name: new_entry[1], type: new_entry[2], db: db)
  end
end
