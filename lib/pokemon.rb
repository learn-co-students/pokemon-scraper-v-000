class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  @@all = []

  def initialize(hash)
    @id = hash[:id]
    @name = hash[:name]
    @type = hash[:type]
    @db = hash[:db]
    hash[:hp] ? (@hp = hash[:hp]) : (@hp = 60)
  end

  def self.save(name, type, db)
    new_poke = Pokemon.new(name: name, type: type, db: db)
    new_poke.db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    found_poke = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
    created = Pokemon.new(id: found_poke[0][0], name: found_poke[0][1], type: found_poke[0][2], hp: found_poke[0][3])
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = #{hp} WHERE id = #{self.id}")
  end

end
