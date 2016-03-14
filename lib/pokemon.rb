class Pokemon
  attr_reader :name, :type, :db

  @@all = []

  def initialize(id, name, type, db)
    @id = id
    @name = name,
    @type = type,
    @db = db
  end

  def self.all
    @@all
  end

  def self.save(name, type, database_connection)
    database_connection.execute(
                                " INSERT INTO Pokemon (name, type)
                                  VALUES (?, ?) ",
                                  name, type
                                 )
  end

  def self.find(id, database_connection)
    database_connection.execute(" SELECT id, name, type FROM Pokemon WHERE id = #{id}")[0]
  end
end
