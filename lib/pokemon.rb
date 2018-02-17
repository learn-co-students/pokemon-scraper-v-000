class Pokemon
    attr_accessor :id, :name, :type, :db, :hp
    
    
    def initialize(id:, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end 
    
   def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
    end
    
    def self.find(id, db)
        pokemon = db.execute("SELECT * FROM Pokemon WHERE id = ?", id).flatten
            name = pokemon[1]
            type = pokemon[2]
        Pokemon.new(id: id, name: name, type: type, db: db)
    end
end
