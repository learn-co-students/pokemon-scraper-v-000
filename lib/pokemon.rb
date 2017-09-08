require 'pry'
class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, db:, hp:nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
  end

  def self.save(name, type, db_connection)
    db_connection.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)",
                          name, type)
  end

  def self.find(id, db_connection)
    attr_arr = db_connection.execute('SELECT * FROM pokemon WHERE id = ?', id).flatten
    Pokemon.new(id: attr_arr[0], name: attr_arr[1], type: attr_arr[2],
                hp: attr_arr[3], db: db_connection)
  end

  def alter_hp(new_hp, db_connection)
    db_connection.execute('UPDATE pokemon SET hp = ? WHERE id = ?', new_hp,
                          @id  )
  end
end
