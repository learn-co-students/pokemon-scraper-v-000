class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, db:, hp: nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(pokemon, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", pokemon, type)
  end

  def self.find(id, db)
    db_return_array = db.execute("SELECT * FROM pokemon WHERE id = ?",id).flatten
    Pokemon.new(id: db_return_array[0], name: db_return_array[1], type: db_return_array[2], hp: db_return_array[3], db: db)
    # or
    # pokemon_info = {}
    # pokemon_info[:id] = db_return_array[0]
    # pokemon_info[:name] = db_return_array[1]
    # pokemon_info[:type] = db_return_array[2]
    # pokemon_info[:hp] = db_return_array[3]
    # pokemon_info[:db] = db
    # Pokemon.new(pokemon_info)
  end

  def alter_hp(new_hp, db)
    if Pokemon.find(id, db).hp != new_hp
      db.execute("UPDATE pokemon SET hp = ? WHERE hp = ?", new_hp, 60)
    end
  end
end
