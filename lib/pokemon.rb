class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, hp: 60, db:)
    @name = name
    @type = type
    @db = db
    @id = id
    @hp = hp
  end

  def self.save(name, type, db)
     db.execute("INSERT INTO pokemon(name, type) VALUES (?, ?);", name, type)
  end

  def self.find(id, db)
    find_by = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    pokemon = Pokemon.new(id: find_by[0], name: find_by[1], type: find_by[2], hp: find_by[3], db: db)
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, self.id)
  end

end
