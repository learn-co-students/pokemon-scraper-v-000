class Pokemon
  #attributes and variables
  attr_accessor :id, :name, :type, :hp, :db

  #initialize
  def initialize(id:, name:, type:, hp: nil, db:)
    @id = id
    @name = name
    @type = type
    @hp = hp
    @db = db
  end

  #class methods
  def self.save(name, type, db)
    sql =<<-sql
      INSERT INTO pokemon(name, type) VALUES
      (?,?);
    sql

    db.execute(sql, name, type)
  end

  def self.find(id, db)
    sql =<<-sql
      SELECT *
      FROM pokemon
      WHERE id = ?;
    sql

    info = db.execute(sql, id).flatten
    Pokemon.new(id: info[0], name: info[1], type: info[2], hp: info[3], db: db)
  end

  #instance methods
  def alter_hp(new_hp, db)
    sql =<<-sql
      UPDATE pokemon
      SET hp = ?
      WHERE id = ?;
    sql
    db.execute(sql, new_hp, self.id)
  end
end
