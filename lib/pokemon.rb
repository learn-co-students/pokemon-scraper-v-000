require 'pry'

class Pokemon

  attr_accessor :id, :name, :type, :hp, :db;

  @@all = []

  def initialize(hash)
    @id = hash[:id]
    @name = hash[:name]
    @type = hash[:type]
    if !hash[:hp].nil?
      @hp = hash[:hp]
    end
    @@all << self
  end

  def self.save(name, type, db)
    #self.new
    #id = @@all.count
    db.execute("INSERT INTO pokemon(name, type) VALUES ('#{name}', '#{type}')")

    #binding.pry
  end

  def self.find(id, db)
    #@@all.detect { |element| element = db.execute("SELECT * FROM pokemon where id = #{id}") }
    #newobject = Pokemon.new
    #binding.pry
    hash = {}
    array = db.execute("SELECT * FROM pokemon where id = #{id}")
    #binding.pry
    hash[:id] = array[0][0]
    hash[:name] = array[0][1]
    hash[:type] = array[0][2]
    hash[:hp] = array[0][3]
    newobject = Pokemon.new(hash)
    newobject
    #binding.pry
    #binding.pry
  end

  def alter_hp(hp, db)
    #db.execute("UPDATE pokemon SET hp = '#{hp}' WHERE id = '#{self.id}'")
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, self.id)
    #binding.pry
    #db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, self.id)
    #binding.pry
  end


end
