class Pokemon
    
    attr_accessor :name, :type, :db, :id, :hp

    def initialize(id:, name:, type:, db:, hp: nil)
        @id, @name, @type, @db, @hp = id, name, type, db, hp
    end
    
    def self.save(pokename, poketype, db)
        db.execute('INSERT INTO pokemon (name, type) VALUES (?, ?)', pokename, poketype)
    end
    
    def self.find(id, db)
        pokemon = db.execute("SELECT * FROM pokemon WHERE pokemon.id = ?", id).flatten
        Pokemon.new(:db => db, :id => pokemon[0], :name => pokemon[1], :type => pokemon[2], :hp => pokemon[3])
    end
    
    def alter_hp(new_hp, db)
       db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
    end
    
end