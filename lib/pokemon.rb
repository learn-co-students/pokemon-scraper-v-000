class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(id: , name: , type: ,hp: nil, db:)
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO Pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(id, db)
    array = db.execute("SELECT * FROM Pokemon WHERE id=(?)", id).flatten
    self.new(id: array[0], name: array[1], type: array[2], hp: array[3], db: db)
  end

  def alter_hp(hp, db)
    db.execute("UPDATE Pokemon SET hp=(?) WHERE hp=(?)", hp, self.id)
  end
end
