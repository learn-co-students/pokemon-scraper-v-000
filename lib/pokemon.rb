class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, db:)
    @name = name
    @type = type
    @db = db
    save
  end

  def save
    @id = id
  end

end
