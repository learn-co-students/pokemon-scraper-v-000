require 'pry'
class Pokemon
    attr_accessor :id, :db, :name, :type, :hp

    def initialize(pkm, hp = nil)
        pkm.each { |k,v| send("#{k}=",v) }
        @hp = hp    
    end

    def self.save(name,type,db)
        begin
            db.execute("INSERT INTO pokemon (name, type, hp) VALUES (?,?,?)",[name, type, 60])
        rescue
            db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)",[name, type])
        end
    end

    def self.find(id,db)
        pkm = db.execute("SELECT * FROM pokemon WHERE pokemon.id = (?)", [id])
        p = pkm[0]
        
        pokemon = Pokemon.new({id: p[0], name: p[1], type: p[2]}, p[3])
        return pokemon
    end
    
    def alter_hp(new_hp, db)
        db.execute("UPDATE pokemon SET hp = ? WHERE pokemon.id = ?",[new_hp, self.id]) 
    end
end
