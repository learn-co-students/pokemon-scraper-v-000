class Pokemon
  
  attr_accessor :id, :name, :type, :db
  
  def initialize(id:, name:, type:, db:)
    # is initialized with arguments - name, type and db
    @name = name 
    @type = type
    @db = db
    @id = id
  end 
  
end
