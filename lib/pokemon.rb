class Pokemon
attr_accessor :id, :name, :type, :db
@@all = []

  def initialize(attributes)
    attributes.each {|key, value| self.send(("#{key}="), value)}
  end

  def self.all
    @@all
  end


  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(id, db)
    mm = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    self.new(id:mm[0],name:mm[1],type:mm[2],db:db)
  end

    #pikachu.alter_hp(59, @db)

  #def alter_hp(health, db)
  #  db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", health, id)
  #end


end
