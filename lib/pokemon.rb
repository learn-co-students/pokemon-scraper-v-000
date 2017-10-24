class Pokemon
  attr_accessor :name, :type, :db, :id

  def initialize(id: nil, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(pk_name, pk_type, db)
    db.execute("CREATE TABLE IF NOT EXISTS pokemon(id INTEGER PRIMARY KEY, name TEXT, type TEXT)")
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", [pk_name, pk_type])
  end

  def self.find(pk_id, db)
    pk = db.execute("SELECT * FROM pokemon WHERE id = ?", pk_id).flatten
    self.new(id: pk[0], name: pk[1], type: pk[2], db: db)
  end



end
