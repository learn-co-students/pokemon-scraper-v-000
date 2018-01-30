class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(name:, type:, id:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save(name, type, db)
    ins = db.prepare('INSERT INTO pokemon (name, type) VALUES (?, ?)')
    ins.execute(name, type)
  end

  def self.find(id, db)
    search = db.execute("SELECT * FROM pokemon WHERE id = ?", id)[0]
    Pokemon.new(name: search[1], type: search[2], id: search[0], db: db)
  end

  def self.execute_create_hp_column(db)
    binding.pry
    db.run File.read('../db/alter_table_migration.sql')
  end
end
