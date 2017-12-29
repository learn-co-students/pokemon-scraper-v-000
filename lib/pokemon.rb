require 'pry'

class Pokemon
  attr_accessor :id, :name, :type, :db, :hp

  def initialize(arg)
    arg.each {|key, value| self.send(("#{key}="), value)}
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", "#{name}", "#{type}")
  end

  def self.find(id, db)
    result_arr = db.execute("SELECT * FROM pokemon WHERE (id) = (?)", "#{id}").flatten
    arg = {id: result_arr[0], name: result_arr[1], type: result_arr[2], hp: result_arr[3]}
    pokemon = Pokemon.new(arg)
  end

  def alter_hp(hp, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, self.id)
  end

end
