class Pokemon

  attr_accessor :id, :name, :type, :hp, :db

  def initialize(id:, name:, type:, hp: nil, db:)
      @id, @name, @type, @hp, @db = id, name, type, hp, db
    end

  def self.save(name, type, database)
    database.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(id_number, db)
    find_pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", id_number).flatten
    Pokemon.new(id: find_pokemon[0], name: find_pokemon[1], type: find_pokemon[2], hp: find_pokemon[3], db: db)
  end

  def alter_hp(change_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", change_hp, self.id)
  end
end
