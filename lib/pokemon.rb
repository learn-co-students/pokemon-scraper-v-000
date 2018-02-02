class Pokemon
attr_accessor :id, :name, :type, :db, :hp
  @@all = []

  def initialize(pokemon)
    @id = pokemon[:id]
    @name = pokemon[:name]
    @type = pokemon[:type]
    @db = pokemon[:db]
    pokemon[:hp] ? (@hp = pokemon[:hp]) : (@hp = 60)
    @@all << self
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    row = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    Pokemon.new(id: row[0], name: row[1], type: row[2], hp: row[3], db: db)
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = #{new_hp} WHERE id = #{id}")
  end

end
