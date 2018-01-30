class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(id=nil, name, type, db)
    if id != nil
      @id = id
    end
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    db.execute("SELECT * FROM pokemon WHERE id=?", id).first
  end
end
