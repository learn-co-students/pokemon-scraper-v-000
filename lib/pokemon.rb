class Pokemon
  attr_accessor :id, :name, :type, :db, :hp


  def initialize(id:, name:, type:, hp: nil, db:)
  @id, @name, @type, @hp, @db = id, name, type, hp, db
end


  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?);", name, type)
  end

  def self.find(id, db)
    columns = db.execute("SELECT * FROM pokemon WHERE id =(?);",id)[0]
    self.new(id: id, name: columns[1], type: columns[2], hp: columns[3], db: db)
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = (?) Where id = (?);", hp, self.id)
  end
end
