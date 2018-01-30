require 'pry'

class Pokemon

  attr_accessor :id, :name, :type, :db, :hp

  def initialize (id:,name:, type:, db:, hp:nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
  end

  def self.find(id, db)
    find = db.execute("SELECT *  FROM pokemon WHERE id = ?", [id]).flatten
    self.new(id: find[0], name: find[1], type: find[2], hp:find[3], db: db)

    #puts("hello world")
    #binding.pry
  end

  def alter_hp(new_hp,db)
    #binding.pry
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?",new_hp, self.id)
    #binding.pry
  end

end
