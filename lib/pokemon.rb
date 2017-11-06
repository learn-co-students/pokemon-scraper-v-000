class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(options = {})
    @name = options["name"]
    @type = options["type"]
    @db = options["db"]
    @id = options["id"]
    @hp = nil
  end

  def self.save(name, type, db)
    sql = <<-SQL
      INSERT INTO pokemon (name, type) VALUES
      (?, ?)
    SQL

    db.execute(sql, name, type)
    results = db.execute("SELECT last_insert_rowid() FROM pokemon;")
    @id = results.flatten.first
  end

  def self.new_from_db(row)
    self.new.tap do |post|
      post.name = row[1]
      post.type = row[2]
      post.id = row[0]
      post.hp = row[3]
    end
  end

  def self.find(id, db)
    sql = <<-SQL
      SELECT * FROM pokemon WHERE id = ? LIMIT 1
    SQL

    results = db.execute(sql, id).flatten
    Pokemon.new_from_db(results)
  end

  def alter_hp(hp, db)
    sql = <<-SQL
      UPDATE pokemon SET hp = ? WHERE id = ?
    SQL
    db.execute(sql, hp, id)
  end
end
