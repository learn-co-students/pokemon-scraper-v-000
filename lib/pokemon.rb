class Pokemon
  
  attr_accessor :id, :name, :type, :db
  @@all = []
  def initialize(id:, name:, type:, db:)
    # is initialized with arguments - name, type and db
    @name = name 
    @type = type
    @db = db
    @id = id
  end 
  
  def save(name, type, db)
    
  end 
  
end
