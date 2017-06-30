class Pokemon
  attr_accessor :id, :name, :type, :hp, :db

  def initialize(id:, name:, type:, hp: nil, db:)
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
  end

  def self.find(id, db)
    user_input = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    self.new(id: id, name: user_input[1], type: user_input[2], hp: user_input[3], db: db)
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE pokemon.id = ?", new_hp, self.id)
  end
end