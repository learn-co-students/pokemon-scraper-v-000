class Pokemon

 attr_accessor :id, :name, :type, :db, :hp

 def initialize(id:, name:, type:, db:, hp: 60)
    self.id = id
    self.name = name
    self.type = type
    self.db = db
    self.hp = hp
  end

 def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

 def self.find(id, db)
   array_properties = db.execute("SELECT * FROM pokemon WHERE id = (?)", id).flatten
   self.new(id: array_properties[0], name: array_properties[1], type: array_properties[2], db: db)
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = (?) WHERE id = (?)", hp, self.id)
   end

end
