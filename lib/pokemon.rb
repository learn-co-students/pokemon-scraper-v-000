class Pokemon
  attr_accessor :name, :type, :db, :id

  def self.save(name, type, db)
    sql =
      <<-SQL
        INSERT INTO pokemon (name, type)
        VALUES (?, ?)
      SQL
    db.execute(sql, name, type)
    # @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
  end

  def self.find(id, db)
    sql =
      <<-SQL
        SELECT *
        FROM pokemon
        WHERE id = ?
      SQL
    result = db.execute(sql, id)[0]
    new_pokemon = {id: result[0], name: result[1], type: result[2], db: db}
    self.new(new_pokemon)
  end

  def initialize(name:, type:, db:, id:)
    @name = name
    @type = type
    @db = db
    @id = id
  end

end
