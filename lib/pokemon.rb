class Pokemon
  attr_accessor :id, :name, :type, :hp, :db

  def initialize(entry)
    @id = entry[:id]
    @name = entry[:name]
    @type = entry[:type]
    @hp = entry[:hp]
    @db = entry[:db]
    entry
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    info = db.execute("SELECT * FROM pokemon WHERE id=#{id}").flatten
    hash = {id: info[0], name: info[1], type: info[2], hp: info[3], db: db}
    newPokemon = Pokemon.new(hash)
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp=#{hp} WHERE id=#{self.id}")
  end
end
