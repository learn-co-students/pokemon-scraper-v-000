class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(attributes = {})
    @id = attributes[:id]
    @name = attributes[:name]
    @type = attributes[:type]
    @db = attributes[:db]
    @hp = attributes[:hp]
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id_stats, db)
    pokemon_stats = db.execute("SELECT * FROM pokemon WHERE id = ?", id_stats).flatten
    Pokemon.new(id: pokemon_stats[0], name: pokemon_stats[1], type: pokemon_stats[2], hp: pokemon_stats[3])
  end

  def alter_hp(adjust_hp, id_num)
    @db.execute("UPDATE TABLE pokemon SET hp = ? WHERE id = ?", adjust_hp, id_num)
  end
end
