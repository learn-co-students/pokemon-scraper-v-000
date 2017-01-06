class Pokemon
  attr_accessor :name, :type, :db, :id, :hp

  @@all = []

  def initialize(hash={})
    hash.each do |k,v|
      self.send("#{k}=", v)
    end
    @@all << self
  end

  def self.all
    @@all    
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    pm = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    Pokemon.new(id: pm[0], name: pm[1], type: pm[2] )
  end
end
