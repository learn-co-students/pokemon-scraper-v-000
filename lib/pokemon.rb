class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  @@all = []

  def initialize(id:, name:, type:, db:, hp: nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp

    @@all << self
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?);", name, type)
  end

  def self.all
    @@all
  end

  def self.find(id_num, db)
    info = db.execute("SELECT * FROM pokemon WHERE id = ? LIMIT 1;", id_num).flatten
    Pokemon.new(id: info[0], name: info[1], type: info[2], hp: info[3], db: db)
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE name = ?;", new_hp, self.name)
  end
end
