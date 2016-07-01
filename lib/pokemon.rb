require 'pry'



class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  @@all = []

  def initialize(id, name, type, db, hp = 60)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.all
    @@all
  end

  def self.save(name, type, db)
    new_db = db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
    id = @@all.size
    new_instance = self.new(id, name, type, new_db)
    @@all << new_instance
  end

  def self.find(number, db)
    db.execute("SELECT * FROM pokemon WHERE id = ?", number)
  end

  def alter_hp(hp_value)
    @db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp_value, @id)
    @hp = hp_value
#    self.first[3] = hp_value
  end

#binding.pry


end
