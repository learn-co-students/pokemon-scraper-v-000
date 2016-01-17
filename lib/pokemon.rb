class Pokemon
  
  attr_accessor :id, :name, :type, :db

  def initialize(id, name, type, db)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    ins = db.prepare('INSERT INTO pokemon (name, type) values (?, ?)')
    ins.bind_params name, type
    ins.execute
  end

  def self.find(id, db)
    arr = db.execute('SELECT * FROM pokemon WHERE pokemon.id = id')
    arr[0]
  end
  
end
