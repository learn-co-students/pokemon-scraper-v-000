class Pokemon
 attr_accessor :id, :name, :type, :db, :hp


  def initialize(id: id, name: name, type: type, db: db, hp: hp)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end


  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES(?,?)",[name,type])
  end

  def self.find(id, db)
    inserts = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    test = Pokemon.new(id: id, name: inserts[1], type: inserts[2], db: db)
    binding.pry
  end
end
