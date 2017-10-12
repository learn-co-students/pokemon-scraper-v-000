require 'pry'
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
    array = database.execute("SELECT * FROM pokemon WHERE pokemon.id = ?", id)
    # hp = database.execute("SELECT pokemon.hp FROM pokemon WHERE pokemon.id = ?", [id]).join
    # binding.pry
    self.new(id: id, name: array[0][1], type: array[0][2], hp: array[0][3], db: database)
  end

  def alter_hp(hp, database)
    database.execute("UPDATE pokemon SET hp = ? WHERE id = ?", [hp, self.id])
  end
end


# Examples:
# db.execute( "INSERT INTO Products ( stockID, Name ) VALUES ( ?, ? )", [id, name])

# ins = db.prepare('insert into catalog (column_name) values (?)')
# string.each { |s| ins.execute(s) }
