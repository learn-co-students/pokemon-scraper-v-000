class Pokemon
  attr_accessor :id, :name, :type, :hp, :db
  @@all = []
  def initialize(id:, name:, type:, hp: 60, db:)
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db
    @@all << self
  end
  def self.all
    @@all
  end
  def self.save(name, type, db)
  end
end
