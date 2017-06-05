require 'pry'

class Pokemon
  attr_accessor :name, :type, :db, :id, :hp
  @@all = []
  def initialize(id:, name:, type:, db:, hp:60)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
    # id = db.execute("SELECT MAX(id) FROM pokemon")[0]
    # # pk = Pokemon.new(id:id, name:name, type:type, db:db)
    # # @@all<<pk
  end

  def self.find(id,db)
    pk = db.execute("SELECT * FROM pokemon WHERE id = (?)",id)
    # binding.pry
    new_pk = Pokemon.new(id:pk[0][0], name:pk[0][1], type:pk[0][2], db:db, hp:pk[0][3])
    new_pk
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)

  end

end
