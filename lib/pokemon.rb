require 'pry'
class Pokemon
attr_accessor :id, :name, :type, :db, :hp

    def initialize(id:, name:, type:, hp:nil, db:)
      @id, @name, @type, @db, @hp = id, name, type, db, hp
    end

    def self.save(name,type,db)
       db.execute("INSERT INTO pokemon(name,type) VALUES(?,?)",name,type )
    end

    def self.find(p_id,db)
      result_array = db.execute("SELECT * FROM pokemon WHERE id = ?" ,p_id).first
      self.new(id: result_array[0], name: result_array[1], type: result_array[2], hp: result_array[3], db: db)
    end

    def alter_hp(hp,db)
      db.execute("UPDATE pokemon SET hp = ? WHERE  id = ?",hp, self.id)
    end

end
