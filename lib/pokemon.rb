require 'pry'
class Pokemon
    attr_accessor :id, :name, :type, :db, :hp
    @@all = []
    def initialize(id:, name:, type:, db:, hp: nil)
        @id = id
        @name = name
        @type = type
        @db = db
        @hp = hp
    end

    def self.all
        @@all
    end

    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
    end

    def self.find(id, db)
        results = db.execute("SELECT * FROM pokemon WHERE id = ?", [id]).flatten
        Pokemon.new(id: results[0], name: results[1], type: results[2], hp: results[3], db:db)
    end

    def alter_hp

    end


end
