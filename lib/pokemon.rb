class Pokemon
  attr_accessor :id, :name, :type, :db
  @@all = []
  
  def initialize(name, id = nil, type = nil)
    @id = id
    @name = name
    @type = type
    @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.save(name, type, db)
    db.execute( "INSERT INTO pokemon ( name, type ) VALUES ( ?, ? )", [name, type] )
  end
  
  def self.find(id, db)
    new_pokemon = db.execute( "SELECT * FROM pokemon WHERE id = (?)", id)
    self.new(new_pokemon[0][1], new_pokemon[0][0], new_pokemon[0][2])
  end

end
