class Pokemon
  attr_reader :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, db:, hp:)
    @id = id
    @name = name
    @type = type
    @hp = 60
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(id, db)
    pikachu_from_db = db.execute("SELECT id, name, type FROM pokemon WHERE id = ?",id).first
    new(id: pikachu_from_db[0], name: pikachu_from_db[1], type: pikachu_from_db[2], db:db )
  end

  #def self.alter_hp(new_hp, db)
    #db.excute("UPDATE pokemon SET hp = ?", [num], [self.id])
    #self.hp = num
  end
end
