class Pokemon
  attr_accessor :id, :name, :type, :db
  def initialize(name:, type:, db:, id:)
    @name = name
    @type = type
    @db = db
    @@id = id
  end
  
  def self.save(name, type, db)
    #@id += 1
    db.execute("INSERT INTO pokemon (id, name, type) VALUES (?, ?, ?)", [@@id,name,type])
  end
  
end
