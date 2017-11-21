class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize (id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save (name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
  end

  def self.find (id, db)
    array = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
    Pokemon.new(id: array[0][0], name: array[0][1], type: array[0][2], db: db)
  end

  def hp
    @db.execute("SELECT hp FROM pokemon WHERE name = ?", @name)[0][0]
  end

  def alter_hp(num, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE name = ?;", num, self.name)
  end

end
