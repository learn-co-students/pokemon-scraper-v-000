class Pokemon
    
    attr_accessor :id, :name, :type, :db

    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
    end

    def self.find(id, db) 
        poke_info = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
        Pokemon.new(id: poke_info[0], name: poke_info[1], type: poke_info[2], db: db)
    end

    def initialize(id:, name:, type:, db:)
        @id = id
        @name = name 
        @type = type 
        @db = db  
    end

end
