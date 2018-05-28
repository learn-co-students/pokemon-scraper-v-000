class Pokemon
  attr_accessor
  @@all = []


  def initialize(name, type, db)
    @name = name
    @type = type
    @db = db
    @@all << self
  end
  
  def self.save
   
  end
end
