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

  def self.save(db, name, type)
    # @@all << self
    # binding.pry
    @db.execute("INSERT INTO Pokemon (db, name, type) VALUES (db, name, type)")
  end

end
