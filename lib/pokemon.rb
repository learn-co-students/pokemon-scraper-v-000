class Pokemon

  attr_accessor :name, :type, :id, :db

  @@all = []

  def initialize(id:, name:, type:, db:)
    @name = name
    @type = type
    @db = db
    @id = id
  end

  def self.save
    @@all << self
  end

end
