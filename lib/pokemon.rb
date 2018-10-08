class Pokemon
  attr_accessor :id, :name, :type, :db
  
  def initialize(attributes)
    attributes.each {|key, value| self.send(("#{key}="), value)}
  end
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end 
  
  def self.find(id, db)
    pk = db.execute("SELECT pokemon.id, pokemon.name, pokemon.type FROM pokemon WHERE id == ?", id).flatten
    self.new(id:pk[0], name:pk[1], type:pk[2], db:db)
  end 
  
end
