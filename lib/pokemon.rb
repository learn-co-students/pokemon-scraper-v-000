class Pokemon
  attr_accessor :id, :name, :type, :db, :hp
  @@all = []

  def initialize(data, hp = nil)
    @hp = hp
    data.each{|key,value| self.send("#{key}=", value)}
	  @@all << self if !@@all.detect {|pokemon| pokemon.name == self.name}
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.all
    @@all
  end

  def self.find(id, db)
    @@all.detect{|pokemon| pokemon.id = id}
  end

  def alter_hp(new_hp, db)
    self.hp = new_hp
  end

end
