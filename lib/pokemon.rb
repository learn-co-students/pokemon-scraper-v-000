require 'pry'
class Pokemon

  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, db:, hp: nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    new_object = db.execute("SELECT name, type, hp FROM pokemon WHERE id = ?", id)
    new_object.collect do |object|
      @name = object[0]
      @type = object[1]
      @hp = object[2]
    end
    Pokemon.new(id: id, name: @name, type: @type, db: db, hp: @hp)
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, self.id)
  end
end
