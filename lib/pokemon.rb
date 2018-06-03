class Pokemon
attr_accessor :name, :type, :db, :id, :hp

  def initialize(name:name, type:type, db:db, id:id, hp:hp)
    @name = name
    @type = type
    @id = id
    @db = db
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(num, db)
    p = db.execute("SELECT * FROM pokemon WHERE pokemon.id = ?",num).flatten
    self.new(name: p[1], type: p[2], db: db, id: p[0], hp: p[3])
  end

  def alter_hp(num, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?",num, self.id)
  end
end
