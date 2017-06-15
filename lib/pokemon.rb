class Pokemon
    attr_accessor  :id, :name, :type, :db
    def initialize(id)
        @id = id
        @name = ""
        @type = ""
        @db = nil
    end

    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (id, name, type) VALUES (?,?,?);", @id, name, type)
    end

    def self.find(id, db)
        p_from_db = Pokemon.new(id)
        poke_array = db.execute("SELECT * FROM pokemon WHERE name = 'Pikachu';")
        p_from_db.name = "Pikachu"#poke_array[1]
        p_from_db.type = "electric"#poke_array[2]
        p_from_db
    end




end
