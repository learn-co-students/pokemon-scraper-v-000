class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, db:, hp: nil)
    @id = id
    @db = db
    @type = type
    @name = name
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute( "INSERT INTO Pokemon ( name, type ) VALUES ( ?, ? );", [name, type])
  end

  def self.find(id, db)
    data_array = db.execute("SELECT * FROM POKEMON WHERE ID = ?", id).flatten
    self.new(id: data_array[0], name: data_array[1], type: data_array[2], db: db, hp: data_array[3])
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ?;", hp)
  end
end
