require 'pry'
class Pokemon
@@all = []
attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
    @@all << self
  end

  def self.all
    @@all
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name,type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
   a = db.execute("SELECT name FROM pokemon WHERE id = id").flatten.join
   b = db.execute("SELECT type FROM pokemon WHERE id = id").flatten.join
   Pokemon.new(id: id, name: a, type: b, db: db)
  end






end
