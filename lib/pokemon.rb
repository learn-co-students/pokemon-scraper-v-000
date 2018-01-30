class Pokemon
  attr_accessor :id, :name, :type, :db, :hp
  def initialize(id: nil, name:, type:, db:, hp: 60)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?);", name, type)
  end

  def self.find(id, db)
    new_pokemon = db.execute("SELECT * FROM pokemon WHERE pokemon.id = ?;", id)[0]
    self.new(id: new_pokemon[0], name: new_pokemon[1], type: new_pokemon[2], db: db, hp: new_pokemon[3])
  end

  def alter_hp(hp, db)
    sql = <<-SQL
      UPDATE pokemon
      SET hp = ?
      WHERE name = ?
      SQL

      db.execute(sql, hp, self.name)
  end

end
