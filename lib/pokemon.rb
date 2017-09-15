require 'pry'
class Pokemon
  attr_accessor :name, :type, :db, :id, :hp

  def initialize(id: id, name: name, type: type, db: db, hp: nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(pk_name, pk_type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", pk_name, pk_type)
  end

  def self.find(id, db)
    # name = db.execute("SELECT name FROM pokemon WHERE id = ?", id).flatten.first
    # type = db.execute("SELECT type FROM pokemon WHERE id = ?", id)[0][0]
    # hp = db.execute("SELECT hp FROM pokemon WHERE id = ?", id).flatten.first
    # Pokemon.new(id: id, name: name, type: type, db: db, hp: hp)
    pokemon_info = db.execute("SELECT * FROM pokemon WHERE id=?", id).flatten
   Pokemon.new(id: pokemon_info[0], name: pokemon_info[1], type: pokemon_info[2], hp: pokemon_info[3], db: db)
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
  end

end
