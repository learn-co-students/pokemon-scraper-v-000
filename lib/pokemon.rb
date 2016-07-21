class Pokemon
  attr_reader :id, :name, :type, :db

  @@all = []
  @@id = 1

  def initialize(id, name, type, db)
    if id == 1
      @id = id
    else
      @id = @@id
      @@id += 1
    end
    @name = name
    @type = type
    @@all << self
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (id, name, type) VALUES (?, ?, ?)", @@id, name, type)
  end

  def self.find(id, db)
    db.execute("SELECT * FROM pokemon WHERE id = (?)", id)
  end
end
