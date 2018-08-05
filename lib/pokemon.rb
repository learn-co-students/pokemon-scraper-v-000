class Pokemon
  attr_accessor :name, :type, :db, :id

  def initialize(name:, type:, db:, id:=nil)
    @name = name
    @type = type
    @db = db
    @id = id
  end

  def save(name, type, db)

  end
end
