# Pokemon Class
class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id, name, type, db, hp = 60)
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db
  end

  def self.save(pokemon, type, db)
    db.execute('INSERT INTO pokemon (name, type) VALUES (?, ?)', pokemon, type)
  end

  def self.find(poke_id, db)
    pokemon_info = db.execute('SELECT * FROM pokemon WHERE id = ?', poke_id).first
    new_id, new_name, new_type, new_hp = *pokemon_info
    Pokemon.new(new_id, new_name, new_type, db, new_hp)
  end

  def alter_hp(new_hp)
    db.execute('UPDATE pokemon SET hp = ? WHERE id = ?', new_hp, id)
  end
end
