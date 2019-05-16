class Pokemon

    attr_accessor :name, :id, :type, :db, :id, :hp

    def initialize(id:, name:, type:, db:, hp: nil)
        @id = id
        @name = name
        @type = type
        @db = db
        @hp = hp

    end 

    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?);", name, type)
    end
    
    def self.find (id, db)
        found_poke = db.execute("SELECT * FROM pokemon WHERE id=?;", id).flatten
        Pokemon.new(id: found_poke[0], name: found_poke[1], type: found_poke[2], db: db, hp: found_poke[3])
    end  
    
    def alter_hp(new_hp, db)
        db.execute("UPDATE pokemon SET hp = ? WHERE id = ?;", new_hp, self.id)
    end


end
