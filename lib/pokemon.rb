class Pokemon
    attr_reader :id, :name, :type, :db, :hp
    
    def initialize(id:, name:, type:, db:, hp: nil)
        @id = id
        @name = name
        @type = type
        @db = db
        @hp = hp
    end
    
    def self.save (name, type, database_connection = @db)
        database_connection.execute("INSERT INTO pokemon (name, type) VALUES ( ?, ? )", [name, type])
    end
    
    def self.find (id, database_connection = @db)
        db_query = database_connection.execute("SELECT * FROM pokemon WHERE id = ?", [id]).flatten
        Pokemon.new(id: db_query[0], name: db_query[1], type: db_query[2], db: database_connection, hp: db_query[3])
    end
    
    def alter_hp (new_hp, database_connection = @db)
        database_connection.execute("UPDATE pokemon SET hp = ? WHERE id = ?", [new_hp, @id])
    end
end
