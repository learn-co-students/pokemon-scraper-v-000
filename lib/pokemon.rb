require 'pry'

class Pokemon
  attr_accessor :id, :name, :type, :db, :hp
  def initialize(args={})
    args.each{ |k, v| self.send("#{k}=", v)}
  end

  def self.save(name, type, db)
    if db.execute('PRAGMA table_info(pokemon);').count == 3
      ins = db.prepare('insert into pokemon (name, type) values (?, ?)')
    else  # HP has been added
      ins = db.prepare('insert into pokemon (name, type, hp) values (?, ?, 60)')
    end
    ins.execute(name, type)
  end

  def self.find(id, db)
    ins = db.prepare("SELECT * FROM pokemon WHERE id = ?")
    results = []
    ins.execute(id).each_hash{|hash| results << hash}
    self.new(results[0])
  end

  def alter_hp(hp, db)
    ins = db.prepare("UPDATE pokemon SET hp = ? WHERE id = ?")
    ins.execute(hp, @id)
  end
end
