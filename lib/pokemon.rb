class Pokemon
  attr_accessor :name, :type, :db, :id, :hp

  def initialize(id: id, name: name, type: type, db: db, hp: hp)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon(name, type) VALUES(?,?)", name, type)
  end
  
  def self.find(pk_id, db)
    pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", pk_id)
    Pokemon.new({:id => pokemon[0][0], :name=>pokemon[0][1], :type=>pokemon[0][2], :hp=>pokemon[0][3]})
  end

  def alter_hp(hp, db)
    pokemon = db.execute("UPDATE pokemon SET hp = ? WHERE name = ?", hp, self.name)
  end
end
