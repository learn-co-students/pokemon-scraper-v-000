class Pokemon
  attr_accessor :id, :name, :type, :db

  @@all = []

  def initialize(attributes)
    attributes.each do |k,v|
      self.send("#{k}=",v)
    end
    @@all << self
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
  end

  def self.all
    @@all
  end


  def self.find(id, db)
    result = db.execute("SELECT * FROM pokemon WHERE id = (?)", id)
    binding.pry
    self.all.detect {|pk| pk.name = result[1]}
  end
end
