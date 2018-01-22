class Pokemon
    
    attr_accessor :name, :type, :db, :id
    
    @@all = []

    def initialize(attributes)
        attributes.each {|key, value| self.send(("#{key}="), value)}
        @@all << self
    end
    
    def self.all
        @@all
    end
    
    def self.save(pokename, poketype, db)
    #   pokemon = db.prepare('INSERT INTO pokemon (name, type) VALUES (?, ?)', pokename, poketype)
    #   pokemon.execute
        db.execute('INSERT INTO pokemon (name, type) VALUES (?, ?)', pokename, poketype)
    end
    
end
