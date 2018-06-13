class Pokemon
  attr_accessor :id, :name, :type, :db

  @@all = []

  def self.all
    @@all
  end

  def initialize(id:, name:, type:, db:)
  end

  def save(name, type, db)
    Pokemon.new(id: self.all.length + 1, name: name, type: type, db: db)
  end

end
