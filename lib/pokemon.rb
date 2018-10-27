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
    # self.save(@id, @name, @type, @db)
  end

  def self.save(id, name, type)
    # @@all << self
    # binding.pry
    @db.execute("INSERT INTO Pokemon (id, name, type) VALUES (id, name, type)")
  end

end
