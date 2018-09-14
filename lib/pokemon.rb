class Pokemon
    attr_accessor :name, :type, :db, :id

    def initialize(id:, name:, type:, db:)
        self.id = id
        self.name = name
        self.type = type
        self.db = db
    end

    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
    end

    def self.find(id, db)
        record = db.execute("SELECT * FROM pokemon WHERE pokemon.id = ?", id).flatten
        Pokemon.new(id: record[0], name: record[1], type: record[2], db: db)
    end
end
