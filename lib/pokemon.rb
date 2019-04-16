require 'pry'

class Pokemon

  attr_accessor :id, :name, :type, :hp, :db

  @@all = []

  def initialize (id:, name:, type:, hp:nil, db:) # Why do these need colons?
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
  end

  def self.all
    @@all
  end

  def self.save(name, type, database_connection)
    database_connection.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    name = db.execute("SELECT name FROM pokemon WHERE id = #{id}").flatten.first
    type = db.execute("SELECT type FROM pokemon WHERE id = #{id}").flatten.first
    hp = db.execute("SELECT hp FROM pokemon WHERE id = #{id}").flatten.first
    self.new(id:id, name:name, type:type, hp:hp, db:db) # What are these colons for?
  end

end
