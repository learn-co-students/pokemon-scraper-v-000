require 'pry'

class Pokemon

  attr_accessor :name, :id, :type, :db

  def initialize (id, name, type, db)
    @id = id
    @name = name
    @type = type
    @db = db
  end

  def self.save (pname, ptype, pdb)
    ins = pdb.prepare('INSERT INTO pokemon (name, type) VALUES (:pname, :ptype);')
    ins.execute("pname" => pname, "ptype" => ptype)
  end

  def self.find (index, pdb)
    ins = pdb.prepare('SELECT * FROM pokemon WHERE id = :this;')
    results = ins.execute("this" => index)
    results.next
  end

end
