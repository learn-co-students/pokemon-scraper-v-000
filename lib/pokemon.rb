class Pokemon
  attr_accessor :id, :name, :type, :db, :hp
  
  def initialize(pokemon)
    @id = pokemon[:id]
    @name = pokemon[:name]
    @type = pokemon[:type]
    @db = pokemon[:db]
    @hp = pokemon[:hp]
  end
  
  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end
  
  def self.find(id_no, db)
    temp = db.execute("SELECT * FROM pokemon WHERE id = ?", id_no)
    Pokemon.new({id: temp[0][0], name: temp[0][1], type: temp[0][2], db: db, hp: temp[0][3]})
  end
  
  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?",new_hp, self.id)
  end
end