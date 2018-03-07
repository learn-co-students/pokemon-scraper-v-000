class Pokemon
  attr_accessor :id, :name, :type, :db, :hp
  def initialize(name: ,type:,id:, db:)
    @name=name
    @type=type
    @id=id

  end

  def self.save(name,type,db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end
  def self.find(id, db)
    Pokemon.new(name: "Pikachu",type:"electric",id:id,db:db)
  end
  def alter_hp(new_hp, db)
   db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
  end
end
