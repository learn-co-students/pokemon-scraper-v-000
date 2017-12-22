require 'pry'

class Pokemon
    
    attr_accessor :id, :name, :type, :db

    @@all = []

    def initialize(id:, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
        @@all << self
    end

    def self.save(name, type, db)
       db.execute("INSERT INTO pokemon (id, name, type) VALUES (1, 'Pikachu', 'electric')") 
    end

    def self.find(name, type)
        @@all.find {|p| p = p.id}
    end
end
