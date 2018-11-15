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
    binding.pry
    @@all << self
  end
  
  def self.find(id, db)
    #binding.pry
  end 
end

