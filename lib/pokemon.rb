require "pry"
class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

    def initialize(db)
      @db = db
      # @name = name
      # @type = type
      # @db = db
    end

    def self.save (name, type, db)
      db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", [name, type])

    end

    def self.find(id, db)
      row=db.execute("SELECT * FROM pokemon WHERE id=?", [id])
      object = Pokemon.new(db)
      object.id=row.flatten[0]
      object.name=row.flatten[1]
      object.type=row.flatten[2]
      object.hp=row.flatten[3]
      save(object.name, object.type, db)
      object
    end

    def alter_hp(hp, db)
      self.hp=hp
    end
end
