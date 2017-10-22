class Pokemon
  attr_accessor :name, :type, :hp
  attr_reader :db, :id

  def initialize(name:, type:, hp: 60, db:nil, id:nil)
    @name = name
    @type = type
    @db = db
    @id = id
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?);", name, type)
    @id = db.execute("SELECT last_insert_rowid() FROM pokemon;")[0][0]
  end

  def self.find(id, db)
    row = db.execute("SELECT * FROM pokemon WHERE id = ?;", id)[0]
    Pokemon.new(name: row[1], type: row[2], id: id)
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE name = ?;", hp, self.name)
  end
end
