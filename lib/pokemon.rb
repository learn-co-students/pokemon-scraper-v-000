class Pokemon
attr_accessor :id, :name, :type, :db

@@all = []

  def initialize(id:, name:, type:, db:)
    @name = name
    @type = type
    @db = db
    @id = id
  end

  def self.save(name, type, db)
    db.execute('INSERT INTO pokemon (name, type) VALUES (?, ?)', name, type)
  end

  def self.find(id, db)
    var = db.execute('SELECT * FROM pokemon WHERE id = ?', id).flatten
    Pokemon.new(id: var[0], name: var[1], type: var[2], db: db)
  end

end
