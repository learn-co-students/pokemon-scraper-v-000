class Pokemon
@@all = []

  def initialize(id:, name:, type:, db: db = nil)
    binding.pry
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(id, name, type)
    db.execute("INSERT INTO pokemon(name, type) VALUES (@name, @type);")
  end

  def find

  end
end
