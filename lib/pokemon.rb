class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, db:, hp: nil)
    @id, @name, @type, @db, @hp = id, name, type, db, hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon(name, type) VALUES(?, ?)", name, type)
  end

  def self.find(id, db)
    new_p =  db.execute("SELECT * FROM pokemon WHERE pokemon.id = (?)", id).flatten
    Pokemon.new(id:new_p[0], name:new_p[1], type:new_p[2], hp:new_p[3], db:db)
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE pokemon.id = ?", new_hp, self.id)
  end



end
