class Pokemon
    DEFAULT_HP = 60

    attr_accessor :id, :name, :type, :hp, :db

    def initialize(id:, name:, type:, hp: nil, db:)
        @id = id
        @name = name
        @type = type
        @hp = hp
        @db = db
    end

    def alter_hp(hp, db)
        @hp = hp

        prepared_update_statement =
            db.prepare('UPDATE pokemon SET hp = ? WHERE id = ?')
        
        prepared_update_statement.execute(@hp, @id)
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
            hp: result_hash['hp'],
            db: db
        )
    end
end
