class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, db:)
  end

  def save(name, type, db)
    Pokemon.new(id:, name: name, type: type, db: db)

  end

end
