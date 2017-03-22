require 'pry'
class Pokemon

  @@all = []
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(pokemon)
    @id = pokemon[:id]
    @name = pokemon[:name]
    @type = pokemon[:type]
    @db = pokemon[:db]
    @hp = pokemon[:hp]
  end

  def self.save(pk_name, pk_type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",pk_name, pk_type)
  end

  def self.find(id, db)
    db.execute("ALTER TABLE pokemon ADD COLUMN hp INTEGER;")
    db.execute("UPDATE pokemon SET hp= 60 WHERE Id=?;", id)
    found = {}
    attributes = db.execute("SELECT id, name, type FROM pokemon WHERE id = ?", id)
    found[:id] = attributes[0][0]
    found[:name] = attributes[0][1]
    found[:type] = attributes[0][2]

    found[:hp] = 60
    self.new(found)
  end

end
