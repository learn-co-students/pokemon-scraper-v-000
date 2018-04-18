class Pokemon
    attr_accessor :id, :name, :type, :hp, :db

    def self.save(name, type, db)
      db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
    end

    def self.find(id, db)
      found = db.execute("SELECT * FROM pokemon WHERE id=?", id).first
      # binding.pry
      Pokemon.new(found[0], found[1], found[2], hp = 60)
    end

    def initialize(id, name=nil, type=nil, hp=nil)
      @id = id
      @name = name
      @type = type
      @hp = hp
      @db = db
    end



end
