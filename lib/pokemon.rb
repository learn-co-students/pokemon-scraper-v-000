class Pokemon
  attr_accessor :id, :name, :type, :hp, :db

  @@all = []

  def initialize(hash)
    hash.each do |key, value|
      self.send("#{key}=", value)
    end
    @@all << self
  end

  def self.all
    @@all
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    info = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    info_hash = {}
    info_hash[:id] = info[0]
    info_hash[:name] = info[1]
    info_hash[:type] = info[2]
    info_hash[:hp] = info[3]
    Pokemon.new(info_hash)
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ?", hp)
  end

end
