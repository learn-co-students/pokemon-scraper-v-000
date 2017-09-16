class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(characteristics, hp=nil)
    @id = characteristics[:id]
    @name = characteristics[:name]
    @type = characteristics[:type]
    @db = characteristics[:db]
    @hp = characteristics[:hp]
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
  end

  def self.find(id, db)
    char_array = db.execute("SELECT * FROM pokemon WHERE id = (?)", id)

    characteristics = {
      :id => char_array[0][0],
      :name => char_array[0][1],
      :type => char_array[0][2],
      :hp => char_array[0][3],
      :db => db
    }

    self.new(characteristics, 60)
  end

  def alter_hp(new_hp, db)
    @hp = new_hp
    db.execute("UPDATE pokemon SET hp = (?) WHERE id = (?)", new_hp, @id)
  end
end
