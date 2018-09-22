class Pokemon

  attr_reader :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, db:, hp: nil)
    #arguments.each {|key, value| self.send(("#{key}="), value)}
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon(name, type) VALUES(?, ?);", name, type)
  end

  def self.find(id, db)
    name = db.execute("SELECT name FROM pokemon WHERE id=?;", id)
    type = db.execute("SELECT type FROM pokemon WHERE id=?;", id)
    hp = db.execute("SELECT hp FROM pokemon WHERE id=?;", id)
    #args = db.execute("SELECT * FROM pokemon WHERE id=?;", id)
    new_pok = Pokemon.new(id: id, name: name[0][0], type: type[0][0], db: db, hp: hp[0][0])
    #new_pok = Pokemon.new(args)
    new_pok
  end

  def alter_hp(health, db)
    db.execute("UPDATE pokemon SET hp=? WHERE id=?;", health, @id)
  end
end
