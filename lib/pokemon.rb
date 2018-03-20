class Pokemon
  attr_accessor :id, :name, :type, :hp, :db

  def initialize(id:, name:, type:, db:, hp: nil)
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db
  end

  def self.save(name, type, db, hp=nil)
    ins = db.prepare("INSERT INTO pokemon (name, type) VALUES (?, ?)")
    ins.execute(name, type)
  end

  def self.find(id, db)
    ins = db.prepare("SELECT * FROM pokemon WHERE id = (?)")
    result = ins.execute(id).next
    Pokemon.new(id: result[0], name: result[1], type: result[2], db: db, hp: result[3])
  end

  def alter_hp(hp, db)
    ins = db.prepare("UPDATE pokemon SET hp = ? WHERE name = ?")
    ins.execute(hp, self.name)
  end
end
