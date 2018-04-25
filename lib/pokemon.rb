class Pokemon
  attr_accessor :id, :name, :type, :db
  def initialize(data)
    data.each{|k, v| self.send(k.to_s+"=", v)}
  end

  def self.save(name, type, db)
    db.execute('INSERT INTO pokemon (name, type) VALUES (?, ?)', name, type)
  end

  def self.find(id, db)
    r = db.execute('SELECT * FROM pokemon WHERE id = ?', id)[0]
    self.new({id: r[0], name: r[1], type: r[2], db: db})
  end
end
