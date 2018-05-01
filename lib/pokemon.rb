require "pry"
class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize (id:, name:, type:, db:, hp: nil)
    @id, @name, @type, @hp, @db = id, name, type, hp, db
  end

  # What is the deal here with passing db?   Since this is an instance method, we already have a db!
  def alter_hp (new_hp, alt_db)
    @hp = new_hp
    ## Burned again!   Adding space between method name and args results in cryptic error about expecing = by new_hp position!
    alt_db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
#    alt_db.execute ("UPDATE pokemon SET hp=? WHERE id=?",new_hp,id)
  end

  def self.save (name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find (id, db)
    db.results_as_hash = true
    results = db.execute("SELECT * FROM pokemon WHERE id=?",id)
    if results[0].has_key?("hp")
      Pokemon.new(id: results[0]["id"], name: results[0]["name"], type: results[0]["type"], hp: results[0]["hp"], db: db)
    else
      Pokemon.new(id: results[0]["id"], name: results[0]["name"], type: results[0]["type"], db: db)
    end
  end
end
