class Pokemon

  attr_accessor :id, :name, :type, :hp, :db

  def initialize(id, name, type, hp = nil, db)
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    info_array = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
    self.new(info_array[0][0], info_array[0][1], info_array[0][2], info_array[0][3], db)
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, self.id)
  end

end
