class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, db:, hp: nil)
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", [name, type])
  end

  def self.find(id, db)
    finder = db.execute("SELECT * FROM pokemon WHERE (id = ?)", id).flatten
    Pokemon.new(id: finder[0], name: finder[1], type: finder[2], hp: finder[3],  db: db)
  end

  def alter_hp(hp, db)
    # binding.pry
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", [hp, self.id])

  end

end
