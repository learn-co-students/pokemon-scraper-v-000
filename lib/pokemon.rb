require 'pry'

class Pokemon
  
  attr_accessor :name, :type, :db, :id
  
  @@all = []
  
  def initialize(id)
    @id = id
    @name = name
    @type = type
    @db = db
  end
  
  def self.all
    @@all << self
  end
  
  def self.save(name, type, db)
    binding.pry
    @@all << save(name, type, db)
    self.each do |pk|
      self.save(pk.name, pk.type, pk.db, pk.id)
    end
  end
end
