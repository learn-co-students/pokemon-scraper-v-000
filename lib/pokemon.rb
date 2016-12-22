require 'pry'

class Pokemon
    attr_accessor :id, :name, :type, :db

    def initialize(id = nil, name, type, db)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(name, type, db, id)
        @db.execute("INSERT INTO pokemon (name, type, db)
        VALUES (?, ?, ?)", name, type, db)
    end


end
