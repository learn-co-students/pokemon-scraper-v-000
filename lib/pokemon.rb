# responsible for saving, adding, removing, or changing
# anything about each Pokémon
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
    sql = <<-SQL
      INSERT INTO pokemon (name, type)
      VALUES (?, ?)
      SQL
    db.execute(sql, name, type)
    @id = db.execute("SELECT last_insert_rowid() FROM pokemon")[0][0]
  end
  # The find method should create a new Pokemon object with an id, type, name AND hp
  # after selecting their row from the database by their id number.
  # remember to also update the initialize method to accept an argument of hp that defaults to nil
  # if not set (so it still passes the non-bonus tests)
  def self.find(id, db)
    sql = <<-SQL
      SELECT *
      FROM pokemon
      WHERE id = ?
      LIMIT 1
    SQL

    db.execute(sql, id).map do |row|
      @name = row[1]
      @type = row[2]
      @hp = row[3]
    end

    self.new(id: id, name: @name, type: @type, db: db, hp: @hp)
  end

  def alter_hp(new_hp, db)
    self.hp = new_hp
    sql = "UPDATE pokemon SET name = ?, type = ?, hp = ? WHERE id = ?"

    db.execute(sql, self.name, self.type, self.hp, self.id)
  end
end
