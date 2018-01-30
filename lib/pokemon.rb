class Pokemon
  attr_reader :id, :name, :type, :db, :hp

  def initialize(attributes)
    @id = attributes[:id]
    @name = attributes[:name]
    @type = attributes[:type]
    @db = attributes[:db]
    @hp = attributes[:hp]
  end

  def self.save(name, type, db)
    db.execute('INSERT INTO pokemon (name, type) VALUES (?, ?)', name, type)
  end

  def self.find(id, db)
    array = db.execute("SELECT * FROM pokemon WHERE id = ?", id)[0]
    hash = {}
    hash[:id] = array[0]
    hash[:name] = array[1]
    hash[:type] = array[2]
    hash[:hp] = array[3] if array.size == 4
    Pokemon.new(hash)
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon set hp = ? where id = ?", hp, id)
  end
end
