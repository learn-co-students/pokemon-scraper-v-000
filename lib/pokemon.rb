class Pokemon

attr_accessor :name, :type, :db, :id

  def initialize(attributes)
    attributes.each {|key, value| self.send(("#{key}="), value)}
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(id, db)
    results = db.execute("SELECT * FROM pokemon WHERE id = #{id}")
    Pokemon.new({id:results[0][0],name:results[0][1],type:results[0][2]})
  end

end
