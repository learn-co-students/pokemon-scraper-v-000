class Pokemon
    attr_accessor :name, :type, :id, :hp, :db

    @@all = []
    
    def initialize(id:, name:, type:, hp: nil, db:)
        @db = db
        @id = id
        @name = name
        @type = type
        @hp = hp
        @@all << self
    end

    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
    end

    def self.find(id, db)
        arr = db.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
        self.new(id:arr[0], name:arr[1], type:arr[2], hp:arr[3], db:db)
    end

    def alter_hp(hp, db)
        db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, self.id)
    end

end
