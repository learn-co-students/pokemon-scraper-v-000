class Pokemon
  attr_accessor :id, :name, :type, :db, :hp
  @@all = []


  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
    @@all << self
  end

  def self.all
    @@all
  end

  def self.clear_all
    @@all.clear
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?);",name, type)
  end

  def self.find(id, db)
    column = db.execute("SELECT * FROM pokemon WHERE id =(?);",id)[0]
    pokemon = self.new(id: id, name: column[1], type: column[2],db: db)
    pokemon.hp = column[3]
    pokemon
  end

  def alter_hp(hp, db)
    self.hp = hp
    db.execute("UPDATE pokemon SET hp = (?) Where id = (?);",hp, self.id)
  end
end
