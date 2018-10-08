class Pokemon
  attr_accessor :id, :name, :type, :db


  def initialize (id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end


  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id,db)
      row = db.execute("SELECT * FROM pokemon WHERE id = ?",id)
      self.new(id: row.flatten[0], name: row.flatten[1], type: row.flatten[2], db: db)
    end

end
