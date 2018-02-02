class Pokemon
attr_accessor :id, :name, :type, :hp, :db
  @@all = []

  def initialize(pokemon)
    pokemon.each {|key, value| self.send("#{key}=", value)}
    @@all << self
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    row = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    Pokemon.new(id: row[0], name: row[1], type: row[2], hp: row[3], db: db)
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, self.id)
  end

end
