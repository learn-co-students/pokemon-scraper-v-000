class Pokemon

attr_accessor :id, :name, :type, :db, :hp

@@all = []

# how is any new Pokemon object going to have an id "passed in", if #save will not

  def initialize (id:, name:, type:, db:, hp: 60)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
    @@all << self
  end

  def self.all
    @@all
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    found = db.execute("SELECT * FROM pokemon WHERE id = #{id}").flatten
    a = Pokemon.new(id: found[0], name: found[1], type: found[2], db: db, hp: found[3])
  end

  def alter_hp(new_hp, db)
    db.execute("UPDATE pokemon SET hp = #{new_hp} WHERE id = #{self.id}")
    self.hp = db.execute("SELECT hp FROM pokemon WHERE id = #{self.id}").join.to_i
  end

end
