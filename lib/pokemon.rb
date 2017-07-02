class Pokemon

  attr_accessor :id, :name, :type, :hp, :db

  def initialize(pairs)
    pairs.each{|k, v| self.send("#{k}=", v)}
  end



  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",
    name, type)
  end



  def self.find(id, db)
    info = db.execute("SELECT * FROM pokemon WHERE id = (?)",
    id).flatten
    Pokemon.new(id: info[0], name: info[1], type: info[2], hp: info[3], db: db)
  end


  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = (?) WHERE id = (?)", hp, self.id)
  end

end
