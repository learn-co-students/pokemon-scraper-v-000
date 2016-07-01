class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  @@all = []

  def initialize(id, name, type, db, hp = 60)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.all
    @@all
  end

  def self.save(name, type, db)
    new_db = db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
    id = @@all.size
    new_instance = self.new(id, name, type, new_db)
    @@all << new_instance
  end

  def self.find(number, db)
    db.execute("SELECT * FROM pokemon WHERE id = ?", number)
  end

  def self.alter_hp(hp_value, db, id_num)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp_value, id_num)

  end

end