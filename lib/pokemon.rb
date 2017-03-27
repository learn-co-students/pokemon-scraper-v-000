class Pokemon

  attr_accessor :name, :type, :db, :id

  def initialize(hash)
    @id = hash[:id]
    @name = hash[:name]
    @type = hash[:type]
    @db = hash[:db]
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
  end


  def self.find(id, db)
    find_pokemon = db.execute("SELECT * FROM pokemon WHERE id == (?)", id)
    hash = {}
    hash[:id] = find_pokemon[0][0]
    hash[:name] = find_pokemon[0][1]
    hash[:type] = find_pokemon[0][2]
    hash[:db] = db
    Pokemon.new(hash)
  end
end
