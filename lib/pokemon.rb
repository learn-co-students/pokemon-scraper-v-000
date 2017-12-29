class Pokemon

  attr_accessor :id, :name, :type, :db


  def initialize (id:, name:, type:, db:)
    @name
    @type
    @db
    @id
  end


#   def initialize(id:, name:, type:, hp: nil, db:)
#   @id, @name, @type, @hp, @db = id, name, type, hp, db
# end


  def self.save (name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end



  def self.find (id, db)
  end


end
