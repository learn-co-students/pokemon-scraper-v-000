require 'pry'

class Pokemon
  attr_accessor :id, :name, :type, :db, :hp



  def initialize(arg, hp = nil)
    @id = arg[0]
    @name = arg[1]
    @type = arg[2]
  end

  def self.save(name, type,db)
      db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(id,db)
    array = db.execute("SELECT * FROM pokemon WHERE id = (?)",id).flatten
    obj = self.new(array)
  end

  def alter_hp(hp,db)
    binding.pry
    re = db.execute("UPDATE pokemon SET hp = (?)",hp)
    binding.pry
  end

end
