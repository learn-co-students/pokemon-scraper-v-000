class Pokemon
  attr_accessor :id, :name, :type, :db

  def initialize(pid, pname, ptype, pdb)
    @id = pid
    @name = pname
    @type = ptype
    @db = pdb
  end

  def self.save(sname, stype, sdb)
    sdb.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", sname, stype)
  end

  def self.find(fid, fdb = @db)
    fdb.execute("SELECT * FROM pokemon WHERE id = ?;", fid)
  end

end
