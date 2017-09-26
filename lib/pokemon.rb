class Pokemon
  attr_accessor :id, :name, :type, :db, :hp
  def initialize(id:, name:, type:, db:, hp: nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
  end

  def self.find(id_num, db)
    sql = <<-SQL
    SELECT *
    FROM pokemon
    WHERE id = ?
    LIMIT 1
    SQL
    new_pokemon = db.execute(sql, id_num).flatten
    self.new(id: new_pokemon[0], name: new_pokemon[1], type: new_pokemon[2], hp: new_pokemon[3], db: db)
  end

  def alter_hp(new_hp, db)
    sql = <<-SQL
    UPDATE pokemon SET hp = ? WHERE id = ?
    SQL
     db.execute(sql, new_hp, self.id).flatten
  end
end
