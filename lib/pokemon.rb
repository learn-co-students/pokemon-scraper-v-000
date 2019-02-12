require 'pry'
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
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

 def self.find(num, db)
   pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", num).flatten
   Pokemon.new(id: pokemon[0], name: pokemon[1], type: pokemon[2], db: db, hp: pokemon[3])
 end

 def alter_hp(hp, db)
   db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, self.id);
 end

end
