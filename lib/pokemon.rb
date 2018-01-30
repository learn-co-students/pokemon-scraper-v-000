class Pokemon
  attr_accessor :name, :type, :db, :id, :hp

  def initialize(id:, name:, type:, hp: nil, db:)
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?);", name, type)
  end

  def self.find(id, db)
    db.execute("SELECT * FROM pokemon WHERE id = ?;", id).flatten
      Pokemon.new(id: array[0], name: array[1], type: array[2], hp: array[3], db: db)
  end

  def alter_hp(hp, db)
    what = db.execute("UPDATE pokemon SET hp = ? WHERE id = ?;", hp, self.id)
  end
end
