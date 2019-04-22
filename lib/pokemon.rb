class Pokemon    #bonus version
  attr_accessor :name, :type, :db, :hp
  attr_reader :id

  def initialize(name:, type:, db:, id: nil, hp: nil)
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

  def self.find(id, db)
    sql = <<-SQL
      SELECT *
      FROM pokemon
      WHERE ID = ?
    SQL

    id, name, type, hp = db.execute(sql, id.to_s).flatten
    self.new(id: id, name: name, type: type, db: db, hp: hp)
  end

 def alter_hp(hp, db)
   db.execute('UPDATE pokemon SET hp = ? WHERE id = ?', hp, id.to_s)
 end

end
