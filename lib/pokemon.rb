class Pokemon
  attr_accessor :name, :type, :db, :id, :hp

  def initialize(name:, type:, db:, id:, hp: nil)
    @name = name
    @type = type
    @db = db
    @id = id
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id_num, db)
    data = db.execute("SELECT * FROM pokemon WHERE id = ?", id_num).flatten
    # binding.pry
    Pokemon.new(id: data[0], name: data[1], type: data[2], hp: data[3], db: db)
  end

  def alter_hp(value, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", value, self.id)
  end
end
