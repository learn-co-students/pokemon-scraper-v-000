class Pokemon

    attr_accessor :id, :name, :type, :db, :hp
   
    def initialize(id:, name:, type:, db:, hp: nil)
        @id = id
        @name = name
        @type = type 
        @db = db
        @hp = hp
    end

    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
    end

    def self.find(id, db)
        pokemon_row = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
        # binding.pry
        p_id = pokemon_row[0]
        p_name = pokemon_row[1]
        p_type = pokemon_row[2]
        p_hp = pokemon_row[3]
        self.new(id: id, name: p_name, type: p_type, db: db, hp: p_hp)
    end

    def alter_hp(num, db)
        db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", num, self.id)
    end

end


