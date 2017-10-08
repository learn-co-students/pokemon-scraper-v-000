class Pokemon 
    attr_accessor :id, :name, :type, :db, :hp

    @@all = []

    def initialize(hash)
        @id = hash[:id]
        @name = hash[:name]
        @type = hash[:type]
        @hp = hash[:hp]
        @db = hash[:db]
        @@all << self 
    end

    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon(name,type) values (?, ?)", name, type)
    end

    def self.find(id, db)
        pokemon_arr = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
        pokemon = {id: pokemon_arr[0], name: pokemon_arr[1], type: pokemon_arr[2], hp: pokemon_arr[3], db: db}
        self.new(pokemon)
    end

    def alter_hp(hp, db)
        db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, id);
    end
end
