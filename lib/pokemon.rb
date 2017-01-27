class Pokemon

attr_accessor :id, :name, :type, :db


  def initialize(name = "Pikachu", type = "electric", db = @db)
    @name = name
    @type = type
    @db = db
  end


  
end
