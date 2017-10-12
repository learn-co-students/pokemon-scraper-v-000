class Pokemon

  attr_accessor :id, :name, :type, :db, :hp

  @@all = []

  def initialize(id:, name:, type:, db:, hp: nil)
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db

    @@all << self
  end

  def self.save(name, type, database)
    database.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", [name, type])
  end

  # def self.save(name, type, hp = "NULL", database)
  #   database.execute("INSERT INTO pokemon (name, type, hp) VALUES (?, ?, ?)", [name, type, hp])
  # end

  def self.find(id, database)
    name = database.execute("SELECT pokemon.name FROM pokemon WHERE pokemon.id = ?", [id]).join
    type = database.execute("SELECT pokemon.type FROM pokemon WHERE pokemon.id = ?", [id]).join
    self.new(id: id, name: name, type: type, hp: hp, db: database)
  end

  def alter_hp(hp, database)
    database.execute("UPDATE pokemon SET hp = hp WHERE name = ?", [self.name])
  end
end


# Examples:
# db.execute( "INSERT INTO Products ( stockID, Name ) VALUES ( ?, ? )", [id, name])

# ins = db.prepare('insert into catalog (column_name) values (?)')
# string.each { |s| ins.execute(s) }
