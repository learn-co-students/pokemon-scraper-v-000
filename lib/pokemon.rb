class Pokemon
  attr_accessor :id, :name, :type, :db

  @@all = []

  def self.all
    @@all
  end

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
    @@all << self
    # self.save(@id, @name, @type, @db)
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type )
  end

  def self.find(id, db)
    # pokemon = db.execute("SELECT id FROM pokemon")
    self.all.detect do |pokemon|
      pokemon.id == id
    end
    # self.new(id:, name:, type:, db:)
  end

end
