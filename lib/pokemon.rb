class Pokemon
    attr_accessor :id, :name, :type, :db
    
    def initialize(id: , name: , type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end 

    def self.save(name, type, db)
       sql = "INSERT INTO pokemon (name, type) VALUES (?, ?);"
       db.execute(sql, name, type)
    end 

    def self.find(id, db)
        sql = "SELECT * FROM pokemon WHERE id = ?"
        entry_array = db.execute(sql, id).flatten
        pokemon = self.new(id: entry_array[0], name: entry_array[1], type: entry_array[2], db: db)
    end 
end
