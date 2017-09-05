require 'pry'
class Pokemon
  attr_accessor :name, :type, :db, :id, :hp

  def initialize(id:, name:, type:, hp: nil, db:)
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find(id, db)
    db_query = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
    new_object = Pokemon.new(id: db_query[0][0], name: db_query[0][1], type: db_query[0][2], hp: db_query[0][3], db: db)
    new_object
  end


    def alter_hp(new_hp, db)
      db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
    end

end
