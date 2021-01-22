class Pokemon
    attr_accessor :name, :type
    attr_reader :id, :db

    def initialize(id:, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", [name, type])
        @id = db.execute("SELECT last_insert_rowid() FROM pokemon") [0][0]
    end

    def self.find(id, db)
        pokemon_array = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
        name = pokemon_array[1]
        type = pokemon_array[2]
        pokemon = Pokemon.new(id: id, name: name, type: type, db: db)
      end
end
