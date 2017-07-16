db = SQLite3::Database.new('db/pokemon.db')

class Pokemon

  @@all = []

  attr_accessor :id, :name, :type, :db

  def initialize(options={})
    @id = options[:id]
    @name = options[:name]
    @type = options[:type]
    @db = options[:db]
    @@all << self
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    name = db.execute("SELECT name FROM pokemon WHERE id = (?)", id).first.first
    type = db.execute("SELECT type FROM pokemon WHERE id = (?)", id).first.first
    self.new({name: name, type: type, db: db, id: id})
  end

  def alter_hp(hp, db)
    db.execute('UPDATE pokemon SET hp = ? WHERE id=?', hp, id) 
  end

end
