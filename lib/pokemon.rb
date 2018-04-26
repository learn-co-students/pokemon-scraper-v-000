class Pokemon
  attr_accessor :id, :name, :type, :hp, :db

  @@all = []

  def initialize(id:, name:, type:, hp: 60, db:)
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db
    @@all << self
  end

  def self.save(name, type, db)
    db.execute("insert into pokemon (name, type) values (?, ?)", name, type) 
  end

  def self.find(id, db)
    row = db.execute("select * from pokemon where id = ?", id)
    Pokemon.new(id: row[0][0], name: row[0][1], type: row[0][2], hp: row[0][3], db: db);
  end

  def alter_hp(hp, db)
    @hp = hp 
    db.execute("update pokemon set (hp) = (?) where id = (?)", hp, id)
  end


end
