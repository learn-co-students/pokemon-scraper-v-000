class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon(name, type) VALUES(?,?)",name, type)
  end

  def self.find(id, db)
    stm = db.prepare("SELECT * FROM pokemon WHERE id = ?")
    stm.bind_param id, id
    rs = stm.execute
    row = rs.next
    self.new(id: id, db: db, name: row[1], type: row[2])
  end

end


# class Pokemon
#   attr_accessor :id, :name, :type, :db, :hp
#
#   def initialize(id:, name:, type:, db:, hp: nil)
#     @id = id
#     @name = name
#     @type = type
#     @db = db
#     @hp = hp
#   end
#
#   def self.save(name, type, db)
#
#     db.execute("INSERT INTO pokemon(name, type) VALUES(?,?)",name, type)
#   end
#
#   def self.find(id, db)
#     stm = db.prepare("SELECT * FROM pokemon WHERE id = ?")
#     stm.bind_param id, id
#     rs = stm.execute
#     row = rs.next
#     self.new(id: id, db: db, name: row[1], type: row[2])
#   end
#
#   def alter_hp
#     self.hp -= 1
#   end
#
#
# end
