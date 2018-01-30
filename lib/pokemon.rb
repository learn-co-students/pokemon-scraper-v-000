class Pokemon
    attr_accessor :id, :name, :type, :db, :hp

    @@all = []

    def initialize(id: id, name: name, type: type, db: db, hp: hp)
        self.id = id
        self.name = name
        self.type = type
        self.db = db
        self.hp = hp if hp
    end

    def self.all
        @@all
    end

    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
    end

    def self.find(id, db)
        pokemon = db.execute("SELECT * FROM pokemon WHERE id = (?)", id).first
        self.new(id: pokemon[0], name: pokemon[1], type: pokemon[2], db: db, hp:pokemon[3])
    end

    def alter_hp(new_hp, db)
        db.execute("UPDATE pokemon SET hp = (?) WHERE pokemon.id = (?)", new_hp, @id)
    end
end
