require 'pry'

require_relative '../bin/sql_runner.rb'

class Pokemon

  @@all = []

  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, db:, hp: nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
    @@all << self
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    value_array = db.execute("SELECT * FROM pokemon WHERE id = ?", id)
    new_pokemon = Pokemon.new(id: value_array[0][0], name: value_array[0][1], type: value_array[0][2], hp: value_array[0][3], db: db)
  end

  def alter_hp(number, db)
  #  SQLRunner.new(db).execute_create_hp_column
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", number, self.id)
  end

end
