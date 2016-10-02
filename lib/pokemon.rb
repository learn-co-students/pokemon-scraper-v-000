class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id, name, type, db)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO Pokemon (name, type) VALUES(?,?)",name, type)
  end

  def self.find(id, db)
    db.execute("SELECT id, name, type FROM pokemon WHERE id =?",id)
  end

  def alter_hp(new_hp, db)
    db.execute("Update poke SET hp = ? WHERE id = ?}",new_hp, self.id)
  end

end
