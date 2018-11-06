require 'pry'
class Pokemon
  attr_accessor :id, :name, :type, :db

  @@all = []

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.all
    @@all
  end

  def self.save(name, type, db)
    id = self.all.count + 1
    db.execute("INSERT INTO pokemon VALUES (?, ?, ?)", id, name, type)
  end


end
