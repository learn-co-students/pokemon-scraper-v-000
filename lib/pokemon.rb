class Pokemon

attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, db: db = nil, hp:60)
    @id = id
    @name = name
    @type = type
    @db = db
    hp != nil ? @hp = hp : @hp=60
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon(name, type) VALUES(?,?)", name, type)
    #binding.pry
  end

  def self.find(id, db)
    found_pk = db.execute("SELECT * from pokemon WHERE (id=?)", id)
    found_pk = found_pk.flatten
    Pokemon.new(id:found_pk[0],name:found_pk[1],type:found_pk[2], db: db, hp:60)
  end

  def alter_hp(new_hp)

  end

end
