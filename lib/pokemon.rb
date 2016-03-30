class Pokemon
  attr_accessor :index, :name, :type, :db
  def initialize(index, name, type, db)
    @index = index
    @name = name
    @type = type
    @db = db
  end

  def self.save(pokename, poketype, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", pokename, poketype)
  end

  def self.find(index, db)
    db.execute("SELECT * FROM pokemon WHERE id = ?", index).flatten
  end

end
