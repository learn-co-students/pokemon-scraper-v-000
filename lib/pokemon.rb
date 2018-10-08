class Pokemon
  attr_accessor :id, :name, :type, :hp, :db
  @@all = []

  def initialize(id:, name:, type:, db:, hp: nil)
    @id= id
    @name= name
    @type= type
    @db= db
    @hp= hp
    @@all << self
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(new_id, db)
    info = db.execute("SELECT * FROM pokemon WHERE pokemon.id = ?", new_id).flatten
    pokemon = self.new(id: info[0], name: info[1], type: info[2], db: db, hp: info[3])
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)

  end

end
