class Pokemon

  @@all = []
  attr_accessor :name, :type, :id, :db, :hp

  def initialize(name:, type:, id:, db:, hp: 60)
    @name = name
    @type = type
    @id = id
    @db = db
    @hp = hp
    @@all << self
  end

  def self.all
    @@all
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    new_pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", id)[0]
    name_from_id = new_pokemon[1]
    type_from_id = new_pokemon[2]
    id_from_id = new_pokemon[0]
    hp_from_id = new_pokemon[3]
    self.new(name: name_from_id, type: type_from_id, id: id_from_id, db: db, hp: hp_from_id)
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
    self.hp = db.execute("SELECT hp FROM pokemon WHERE id = ?", self.id)[0]
  end

end
