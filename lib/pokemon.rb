class Pokemon
    attr_accessor :name, :type, :db, :id

    def initialize(id: nil, name: name, type: type,db: db)
      @name = name
      @type = type
      @db = db
      @id = id
    end

    def self.save(name, type, db)
      db.execute("INSERT INTO pokemon(name, type) VALUES(?,?)", name, type)
    end

    def self.find(id,db)
      find = db.execute("SELECT * from pokemon WHERE id = ?",id).flatten
      Pokemon.new(id: find[0],name: find[1], type: find[2], db: db)
    end


end
