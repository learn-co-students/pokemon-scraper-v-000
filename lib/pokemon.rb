class Pokemon
  attr_accessor :id, :name, :type, :hp, :db

  def initialize (id:, name:, type:, hp: nil, db:)
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db
  end

  def self.save (name, type, db_connect)
    db_connect.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",name, type)
  end

  def self.find (id_num, db_connect)
    pk_info = db_connect.execute("SELECT * FROM pokemon WHERE id = ?", id_num).flatten
    self.new(id: id_num, name: pk_info[1], type: pk_info[2], hp: pk_info[3], db: db_connect)
  end

  def alter_hp (new_hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id )
  end
end
