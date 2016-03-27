
class Pokemon
  attr_accessor :name, :type, :db
  @@all = []
  def initialize(id, name, type, db)
    @name = name
    @type = type
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES ('Pikachu', 'fire')")
  end

  def self.find(id,db)
    result = db.execute("SELECT id,name,type FROM pokemon WHERE id = #{id};")
    result[0]
  end
end
