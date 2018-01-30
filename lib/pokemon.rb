class Pokemon
  attr_accessor :id, :name, :type, :hp, :db

  def initialize (id: nil, name:, type:, hp: nil, db: @db)
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db
  end

  def self.save (name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    values = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    Pokemon.new(id: values[0], name: values[1], type: values[2], hp: values[3])
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, self.id)
  end
end
