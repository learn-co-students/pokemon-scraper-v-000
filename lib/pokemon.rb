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
    found_em = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
    self.new(id: found_em[0][0], name: found_em[0][1], type: found_em[0][2], hp: found_em[0][3] )
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = #{new_hp} WHERE id = #{id}")
  end

end
