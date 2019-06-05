class Pokemon

  attr_accessor :id, :name, :type, :db

  def self.all
    @@all
  end

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
  end

  def self.find(id, db)
    pk_arry = db.execute("SELECT id, name, type FROM pokemon WHERE id = ?", id).flatten
    #id = pk_arry[1]
    #name = pk_arry[2]
    #type = pk_arry[3]
    Pokemon.new(id: pk_arry[0], name: pk_arry[1], type: pk_arry[2], db: db)
  end

end
