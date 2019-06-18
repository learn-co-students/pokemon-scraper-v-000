class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize (id:, name:, type:, hp: nil, db:)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save (name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
  end

  def self.find(id, db)
    attributes_array = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    Pokemon.new(id: attributes_array[0], name: attributes_array[1], type: attributes_array[2], hp: attributes_array[3], db: db)
  end

  def alter_hp(updated_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", updated_hp, self.id)
  end

end
