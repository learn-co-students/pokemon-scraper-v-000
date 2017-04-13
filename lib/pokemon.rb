
class Pokemon
  @@all = []
attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db

  end


  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name,type)
  end

  def self.find(idNum, db)
      pok = db.execute("SELECT * FROM pokemon WHERE id=?", idNum).flatten
      Pokemon.new(id: pok[0], name: pok[1], type: pok[2],  db: db)
    end

end
