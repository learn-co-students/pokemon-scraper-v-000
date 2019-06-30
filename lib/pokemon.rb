require 'pry'

class Pokemon
    attr_accessor :id, :name, :type, :hp, :db

    @@all = []

    def initialize(id: nil, name: nil, type: nil, hp: nil, db: nil)
        @id = id
        @name = name
        @type = type
        @hp = hp
        @db = db
        @@all << self
    end

    def alter_hp(hp, database)
        # binding.pry
        database.execute("UPDATE pokemon set hp = ? where name = ?", hp, self.name)
    end
    # database.execute("select * from pokemon")

    def self.save(name, type, database)
        database.execute("insert into pokemon (name, type) values (?, ?)", name, type)
    end

    def self.find(num, database)
        a = database.execute("select * from pokemon where id = ?", num)
        # binding.pry
        self.new(id: a[0][0], name: a[0][1], type: a[0][2], hp: a[0][3], db: database)

    end

    def self.all
        @@all
    end
end
