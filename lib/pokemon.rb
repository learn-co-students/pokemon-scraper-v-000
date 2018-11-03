class Pokemon

  attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.all
    @@all
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES ('#{name}', '#{type}')")
  end

  def self.find(id, db)
    array = db.execute("SELECT name, type FROM pokemon WHERE id = #{id}")
    self.new(id: id, name: array[0][0], type: array[0][1], db: db)
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = #{hp} WHERE name = '#{self.name}'")
  end

  def hp
    array = db.execute("SELECT hp FROM pokemon WHERE name = '#{self.name}'")
    array[0][0]
  end
end
