class Pokemon
    attr_accessor :id, :name, :type, :db

    def initialize(id:, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def self.save(name, type, db)
        prepared_insert_statement =
            db.prepare('INSERT INTO pokemon (name, type) VALUES (?, ?)')
            
        prepared_insert_statement.execute(name, type)
    end

    def self.find(id, db)
        prepared_select_statement = 
            db.prepare('SELECT * FROM pokemon WHERE id = ?')

        result_hash = prepared_select_statement.execute(id).next_hash

        Pokemon.new(
            id: id, 
            name: result_hash['name'], 
            type: result_hash['type'], 
            db: db
        )
    end
end
