class Pokemon

  attr_accessor :id, :name, :type, :db, :hp

  @@all = []

  def initialize(id:, name:, type:, db:, hp: nil)
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db
    @@all << self
  end

  def self.all
    @@all
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
  end

  def self.find(id, db)
    instance = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten

    id = instance[0]
    name = instance[1]
    type = instance[2]
    hp = instance[3]

    Pokemon.new(id:id, name:name, type:type, db:db, hp:hp)
  end

  def alter_hp(new_hp, db)
     db.execute("UPDATE pokemon SET hp = ? WHERE name = ?;", new_hp, self.name)
   end
end
