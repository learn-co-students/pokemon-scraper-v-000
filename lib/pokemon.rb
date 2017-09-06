class Pokemon

  attr_accessor :id, :name, :type, :db

  @@all = []

  def initialize(id)
    @id = id
    @@all << self
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon(name, type) VALUES(?, ?)", name, type)
  end

  def self.find(id, db)
  end
end
