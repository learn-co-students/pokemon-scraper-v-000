class Pokemon
    attr_accessor :id, :name, :type, :hp, :db

    def self.save(name, type, hp=60, db)
        db.execute("INSERT INTO pokemon (name, type, hp) VALUES (?, ?, ?);",name, type, hp)
    end

    def self.find(id, db)
        this_pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?;", id)
        new_pokemon = Pokemon.new(id: id, name: this_pokemon.first[1], type: this_pokemon.first[2], hp: this_pokemon.first[3], db: db)
    end

    def initialize(id:, name:, type:, hp: 60, db:)
        @id = id
        @name = name
        @type = type
        @hp = hp
        @db = db
    end

    def alter_hp(hp, db)
        id = self.id
        db.execute("UPDATE pokemon SET hp = ? WHERE id = ?;", hp, id)
    end
end
