class Pokemon

  attr_accessor :id, :name, :type, :db

   def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
   end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon(name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    info = db.execute("SELECT * FROM pokemon WHERE id?", id)
    Pokemon.new(info[0], info[1], info[2], db)
  end

end
