class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(id: nil, name:, type:, db:)
    @name = name
    @type = type
    @db = db
    @id = id
  end

  def self.save(pk_name, pk_type, db)
    db.prepare("INSERT INTO pokemon (name, type) VALUES (?, ?)" ).execute(pk_name, pk_type)
  end

  def self.find(id, db)
    result = db.query("SELECT * FROM pokemon WHERE id = (?)", id).first
    Pokemon.new(id: id,name: result[1], type: result[2], db: db)
  end

end  #  End of Class
