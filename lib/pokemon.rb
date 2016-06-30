require 'pry'



class Pokemon
  attr_accessor :id, :name, :type, :db

  @@all = []

  def initialize(id, name, type, db)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.all
    @@all
  end

  def self.save(name, type, db)
    new_db = db.execute("INSERT INTO pokemon (name, type) VALUES ('#{name}', '#{type}');")
    id = @@all.size
    new_instance = self.new(id, name, type, new_db)
    @@all << new_instance
  end

  def self.find(number, db)
    db.execute("SELECT * FROM pokemon WHERE id = #{number};")
  end



end
