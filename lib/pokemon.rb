class Pokemon

        attr_accessor :name, :type, :db
        def initialize(id=nil, name, type, db)
                @name=name
                @type=type
                @db=db

        end

       def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id_num, db)
          db.execute("SELECT id, name, type FROM pokemon WHERE id=?", id_num).first

  end


end
