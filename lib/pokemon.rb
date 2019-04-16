class Pokemon
  attr_accessor :name, :type, :db, :id, :hp
  def initialize name:, type:, db:, id:, hp: nil
    @name=name; @type=type; @db=db; @id=id; @hp=hp
  end
  def self.save name, type, db
    db.execute("INSERT INTO pokemon (name,type) VALUES ('#{name}','#{type}')")
  end
  def self.find id, db
    r=db.execute("SELECT * FROM pokemon WHERE id IS #{id}")
    return self.new(id: r[0][0],name: r[0][1],type: r[0][2], db: db, hp: r[0][3])
  end
  def alter_hp(hp,db)
    @hp=hp
    db.execute("UPDATE pokemon SET hp=#{hp} WHERE id=#{@id}")
  end
end
