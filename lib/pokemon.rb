class Pokemon

    attr_accessor :name, :id, :type, :db, :hp


    def initialize(id:, name:, type:, db:)
        @id = id 
        @name = name
        @type = type
        @db = db
    end

    def self.save(name, type, db)
        db.execute("INSERT INTO pokemon (name, type) VALUES(?, ?)", name, type)
    end

    def self.find(id, db)
        response = db.execute("SELECT * FROM (pokemon) WHERE id=?", id).flatten
        self.new(id: response[0], name: response[1], type: response[2], db: db)
    end

end
