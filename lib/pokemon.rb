class Pokemon

    attr_accessor :id, :name, :type, :db, :hp

    def initialize(id: nil, name:, type:, db:, hp: nil)
        @id = id
        @name = name
        @type = type
        @db = db
        @hp = hp
    end

    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
    end

    def self.find(id, db)
        db.execute("SELECT * FROM pokemon WHERE id = ? LIMIT 1", id).map do |row|
            id = row[0]
            name = row[1]
            type = row[2]
            hp = row[3]
            self.new(id: id, name: name, type: type, db: db, hp: hp)
        end.first
    end

    def alter_hp(hp, db)
        db.execute("UPDATE pokemon SET hp = ?", hp)
    end

end
