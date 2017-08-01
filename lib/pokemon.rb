class Pokemon
  attr_accessor :id, :name, :type, :db, :health

  def initialize(id: id, name: name, type: type, db: db)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    test = db.execute("SELECT id, name, type FROM pokemon WHERE id = ?", id)
    pokemon = Pokemon.new(id: test[0][0], name: test[0][1], type: test[0][2])
  end

  #def alter_hp(health, db )
  #  db.execute("INSERT INTO pokemon (health) VALUES (?)", health)
  #end

end
