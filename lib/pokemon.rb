class Pokemon
# attr_accessor :name, :type, :db, :id, :hp
#
#   def initialize(name:, type:, db:, id:, hp: nil) # is initialized with keyword arguments of name, type, db, and id
#     @name = name
#     @type = type
#     @db = name, type, db, id, hp
#     @id = id
#     @hp = hp
#   end
#
#   def self.save(name, type, db) # saves an instance of a pokemon with the correct id
#     db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
#   end
#
#   def self.find(id_number, db) # finds a pokemon from the database by their id number and returns a new Pokemon object
#     pokemon_details = db.execute("SELECT * FROM pokemon WHERE id=?",id_number).flatten
#     Pokemon.new(id: pokemon_details[0], name: pokemon_details[1], type: pokemon_details[2], hp: pokemon_details[3], db: db)
#   end
#
#   def alter_hp(new_hp, db)
#     db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
#   end

attr_accessor :id, :name, :type, :hp, :db

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id_num, db)
    pokemon_info = db.execute("SELECT * FROM pokemon WHERE id=?", id_num).flatten
    Pokemon.new(id: pokemon_info[0], name: pokemon_info[1], type: pokemon_info[2], hp: pokemon_info[3], db: db)
  end

  def initialize(id:, name:, type:, hp: nil, db:)
    @id, @name, @type, @hp, @db = id, name, type, hp, db
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
  end

end
