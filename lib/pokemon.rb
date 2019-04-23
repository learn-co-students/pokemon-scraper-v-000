class Pokemon
    attr_accessor :name, :type, :db, :id, :hp
    def initialize(id:, name:, type:, db:, hp: nil)
        @name = name
        @type = type
        @id = id
        @db = db
        @hp = hp
    end
    
    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (name, type) VALUES ( ?, ? )", name, type)
    end
    
    def self.find(id, db)
        new_poke_info = db.execute("SELECT * FROM pokemon").flatten
        Pokemon.new(id: new_poke_info[0], name: new_poke_info[1], type: new_poke_info[2], hp: new_poke_info[3], db: db)
    end
    
    def alter_hp(nu_hp, db)
        db.execute("UPDATE pokemon SET hp = (?)", nu_hp)
    end
end
