class Pokemon
  attr_accessor :name, :type, :db, :id, :hp

  @@all = []

  def initialize(name:, type:, id:, db:, hp: nil)
    @name = name
    @type = type
    @id = id
    @hp = hp
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id_num, db)
    info = db.execute("SELECT * FROM pokemon WHERE id = ?", id_num).first
    Pokemon.new(id: info[0], name: info[1], type: info[2], hp: info[3], db: db)
  end

  def alter_hp(value, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", value, self.id)
  end

end
