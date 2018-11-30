class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, db:)
#Pokemon .initialize is initialized with keyword arguments of id, name, type and db
    @id = id
    @name = name
    @type = type
    @db = db
    #@@all << self
  end

end
