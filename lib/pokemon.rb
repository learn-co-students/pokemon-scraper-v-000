class Pokemon
  attr_reader :id, :name, :type, :db, :hp

  def initialize(attributes = {:hp => nil})
    @id = attributes[:id]
    @name = attributes[:name]
    @type = attributes[:type]
    @db = attributes[:db]
    @hp = attributes[:hp]
  end

  def alter_hp(new_hp, db)
    db.execute('UPDATE pokemon SET hp = ? WHERE id = ?;', [new_hp, @id])
  end

  def self.find(id, db)
    poke_arr = db.execute('SELECT * FROM pokemon WHERE id=?', id)[0]
    self.new({
      :id => poke_arr[0],
      :name => poke_arr[1],
      :type => poke_arr[2],
      :hp => poke_arr[3],
      :db => db
    })
  end

  def self.save(pk_name, pk_type, db)
    db.query('INSERT INTO pokemon (name, type) VALUES (?,?)', [pk_name, pk_type])
  end

end
