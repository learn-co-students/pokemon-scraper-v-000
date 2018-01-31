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
end