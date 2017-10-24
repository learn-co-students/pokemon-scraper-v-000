class Pokemon

  attr_accessor :id, :name, :type, :db

  def initialize(arguments)
    arguments.each do |k,v|
      self.send("#{k}=",v)
    end
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
  end

  def self.find(id, db)
    db.execute("SELECT * FROM pokemon WHERE id = ?"),id)
  end

end #class Pokemon
