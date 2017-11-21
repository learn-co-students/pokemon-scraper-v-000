class Pokemon
  attr_accessor :id, :name, :type, :hp, :db

  def initialize(id: nil, name:, type:, hp: 60, db:)
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id_number, db)
    pokemon_info_arr = db.execute("SELECT * FROM pokemon WHERE id = ?", id_number).flatten

    Pokemon.new(id: pokemon_info_arr[0], name: pokemon_info_arr[1], type: pokemon_info_arr[2], hp: pokemon_info_arr[3], db: db)
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, self.id)
  end
end
