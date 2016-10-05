require 'pry'
class Pokemon
    attr_accessor :id, :name, :type, :db, :hp

    @@all = []

    def initialize(id: id, name: name, type: type, db: db, hp: hp = 60)
        @id = id
        @db = db
        @hp = hp
        @name = name
        @type = type
        @@all << self
    end

    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (name, type, hp) VALUES (?,?, '60')", name, type)
    end

    def self.find(id, db)
         row = db.execute("SELECT * FROM pokemon WHERE id = (?)", id).flatten
         self.new(id: row[0], name: row[1], type: row[2], db: db, hp: row[3])
    end

    def alter_hp(hp, db)
        db.execute("UPDATE pokemon SET hp = (?) WHERE id = (?)", hp, self.id)
    end
end
