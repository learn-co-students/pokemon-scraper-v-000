class Pokemon
  attr_accessor :id
  @all = []

  def initialize(name, type, db)
    @name = name
    @type = type
    @db = db
  end
end
