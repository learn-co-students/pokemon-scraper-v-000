class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(obj)
    @id = obj[:id]
    @name = obj[:name]
    @type = obj[:type]
    @db = obj[:db]
  end

  def self.save(name, type, db)
    db.prepare('INSERT INTO pokemon (name, type) values (?,?)').execute(name,type)
  end

  def self.find(id,db)
    db.results_as_hash = true
    pokemon = db.prepare('SELECT * FROM pokemon WHERE id = ?').execute(id).first

    Pokemon.new(id: pokemon["id"], name: pokemon["name"], type: pokemon["type"], db: db)
  end

end
