class Pokemon
    attr_accessor :id, :name, :type, :db, :hp
    def initialize(id:, name:, type:, db:)
        @id, @name, @type, @db = id, name, type, db
    end

    def alter_hp(new_value, db)
        db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_value, self.id)
        rtn = db.execute("SELECT hp FROM pokemon WHERE id = ?", self.id).flatten!
        self.hp = rtn[0]
        self.hp
    end
    
    def self.find(id, db)
        data = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
        pokemon = Pokemon.new(id: data[0], name: data[1], type: data[2], db: db)
        pokemon.hp = data[3]
        pokemon
    end

    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
    end
end
