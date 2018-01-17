class Pokemon

  def initialize(name, type, db)
    db.execute( "INSERT INTO pokemon (name, type) VALUES (?, ?)", [id, name])
  end

  def self.save
  end

  def self.find
  end

end
