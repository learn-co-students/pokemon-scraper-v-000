require 'pry'
class Pokemon
  attr_accessor :id, :name, :type, :hp, :db
  
  @@all = []

  def initialize(id: nil, name: nil, type: nil, hp: nil, db: nil)
    local_variables.each do |k|
      v = eval(k.to_s)
      instance_variable_set("@#{k}", v) unless v.nil?
    end
    instance_variable_set("@hp", 60) 
    @@all << self
  end

  def self.all
    @@all
  end
 
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", [name, type])
  end
  
  def self.find(id, db)
    pk = db.execute("SELECT * from pokemon WHERE id = ?", [id]).flatten
    pk_name = pk[1]
    pk_type = pk[2]
    pk_hp = pk[3]
    self.new(id:id, name:pk_name, type:pk_type, hp:pk_hp, db:db)
  end
  
  def alter_hp(new_hp, db)
    
    db.execute("UPDATE pokemon SET hp=? WHERE id=?", new_hp, @id)
  
  end
end
