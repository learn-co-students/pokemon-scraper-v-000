class Pokemon
  attr_accessor :id, :name, :type, :hp, :db

  def initialize(id:, name:, type:, hp: nil, db:)
    @id, @name, @type, @hp, @db = id, name, type, hp, db
  end

  def self.save(pk_name, pk_type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", pk_name, pk_type)
  end

  def self.find(pk_id, db)
    db.execute("SELECT * FROM pokemon WHERE id = (?)", pk_id)
  end

end
