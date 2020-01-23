class Pokemon
  attr_accessor :name, :type, :db, :hp
  attr_reader :id

  def initialize(id:, name:, type:, db:, hp: nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(name, type, db)
    sql = "INSERT INTO pokemon (name, type) VALUES (?,?)"
    db.execute(sql, name, type)
  end

  def self.find(id, db)
    sql = <<-SQL
      SELECT *
      FROM pokemon
      WHERE id = ?;
    SQL

    pokemon_info = db.execute(sql,id).flatten
    Pokemon.new(id: pokemon_info[0], name: pokemon_info[1], type: pokemon_info[2],
     hp: pokemon_info[3], db: db)
   end

   def alter_hp(new_hp, db)
     sql = "UPDATE pokemon SET hp = ? WHERE id = ?"
     db.execute(sql, new_hp, self.id)
   end

end
