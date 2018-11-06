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

  def self.save(name, type, db)
    id = @@all.count + 1
    @@all << Pokemon.new(id: id, name: name, type: type, db: db)
  end

  def self.all
    @@all
  end
end
