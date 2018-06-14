class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, db:, hp: nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) 
      VALUES (?, ?)", name, type)
  end

  def self.find( id, db)
    array = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
    array_2 = array[0]
    new_instance = self.new(id:array_2[0], name:array_2[1], type:array_2[2], db:db)
  end

  def alter_hp(new_hp, db)
    db.execute()
  end

end
