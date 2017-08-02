require 'pry'
class Pokemon

  attr_accessor :name, :type, :id, :db, :hp



  def initialize(id:, name:, type:, db:, hp: nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp

  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
  end

  def self.find(pok_id, db)

    poke = db.execute("SELECT * FROM pokemon WHERE id = ?", pok_id)
    new_poke = Pokemon.new(id:poke.flatten[0], name:poke.flatten[1], type:poke.flatten[2], db:db)

    new_poke
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, self.id)
  end



end
