class Pokemon
    attr_accessor :id, :name, :type, :db, :hp

    @@all = []

    def initialize(id:, name:, type:, db:, hp: nil)
        @id = id
        @name = name
        @type = type
        @db = db
        @@all << self
    end

    def self.all
        @@all
    end

    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (name, type ) VALUES ( ?, ? )", name, type)
    end

    def self.find(id, db)
        pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
        Pokemon.new(id: id, name: pokemon[0][1], type: pokemon[0][2], db: db)
    end

    #def alter_hp(altered_hp, db)
    #    db.execute("UPDATE pokemon SET hp = ? WHERE pokemon.id = ?", )
    #end
end
