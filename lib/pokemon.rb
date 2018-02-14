require 'pry'
class Pokemon
attr_accessor :name, :type, :db, :id, :hp
@@all = []

    def initialize(id = nil, name = nil, type = nil, db = nil, hp)
        @id = id
        @name = name
        @type = type 
        @db = db
        @hp  = hp
        @@all << self
    end

    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
    end

    def self.find(id, db)
        new_guy = db.execute("SELECT * FROM pokemon WHERE id = ?", id).first
        self.new(@id = new_guy[0], @name = new_guy[1], @type = new_guy[2], @hp = new_guy[3])
    end

    def alter_hp(new_hp, db)
        db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
        #binding.pry
    end
end
