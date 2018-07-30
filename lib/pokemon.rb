class Pokemon
  extend Savable::ClassMethods, Findable::ClassMethods

  @@all = []

  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id: nil, name:, type: , db:, hp: 60)
    @id = id
    @name = name
    @type = type
    @db = db
    @@all << self
  end

  def alter_hp(new_val, db)
     db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", [new_val, self.id])
  end
end
