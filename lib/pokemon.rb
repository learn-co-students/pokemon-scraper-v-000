class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(id, name, type, db)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(pk_name, pk_type, db)
    db.prepare("INSERT INTO pokemon (name, type) VALUES (?, ?)" ).execute(pk_name, pk_type)
  end

  def self.find(id, db)
    result = db.query("SELECT * FROM"  db "WHERE id = (?)", id)
    binding.pry
    Pokemon.new(id, result[1], result[2], db)
  end

end  #  End of Class
