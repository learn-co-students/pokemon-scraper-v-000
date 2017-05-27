class Pokemon
<<<<<<< HEAD
  attr_accessor :name, :type, :db, :id

  def initialize(id:, name:, type:, db:)
=======
  attr_accessor :name, :type, :db

  def initialize(id, name, type, db)
>>>>>>> a24084c2129a64e257e9affa991c58df3f51d0a2
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
  end

<<<<<<< HEAD
  def self.find(id_num, db)
    pokemon_info = db.execute("SELECT * FROM pokemon WHERE id=?", id_num).flatten
    Pokemon.new(id: pokemon_info[0], name: pokemon_info[1], type: pokemon_info[2], db: db)
=======
  def self.find(id, db)
    db.execute("SELECT * FROM pokemon WHERE id = ?",id).first
>>>>>>> a24084c2129a64e257e9affa991c58df3f51d0a2
  end
end
