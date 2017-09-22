class Pokemon
  attr_accessor :name, :type, :db, :id, :hp

  def initialize (name:, type:, db:, id:, hp: nil)
    @name = name
    @type = type
    @db = db
    @id = id
    @hp = hp
  end

  def self.save(name, type, db)
    sql = <<-SQL
      INSERT INTO pokemon(name, type)
      VALUES (?, ?)
    SQL
    db.execute(sql, name, type)
  end

  def self.find(id_num, db)
    sql = <<-SQL
      SELECT * FROM pokemon
      WHERE id = ?
    SQL
    pokemon_row = db.execute(sql, id_num).flatten
    self.new(id: pokemon_row[0], name: pokemon_row[1], type: pokemon_row[2], db: db)
  end

  def alter_hp(new_hp, db)
    sql = <<-SQL
      UPDATE pokemon SET hp = ? WHERE id = ?
    SQL
    db.execute(sql, new_hp, self.id)
  end

end
