class Pokemon
  attr_accessor :id, :name, :type, :db
  @@all = []
  def self.save(name, type, db)
    db.execute("INSERT INTO Pokemon (name, type) VALUES (?, ?)",name, type)

  end

  def initialize(id:nil, name: nil, type: nil, db: nil)
    @id = id
    @name = name
    @type = type
    @db = db
    @@all << self


  end

  def self.find(number, db)
    @@all.each do |pokemon|
      if @id = number
        return pokemon
      end
    end


  end
end
