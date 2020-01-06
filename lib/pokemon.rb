class Pokemon
    attr_accessor :name, :type
    attr_reader :id, :db

    def initialize(id:, name:, type:, db:)
        @id = id
        @name = name
        @type = type
        @db = db
    end

    def save
        DB[:conn].execute("INSERT INTO pokemon (name, type), VALUES (?, ?)", [name, type])
    end

    def find
    end

end
