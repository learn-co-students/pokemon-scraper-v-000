class Pokemon
  attr_accessor :id, :name, :type, :db

  #https://robots.thoughtbot.com/ruby-2-keyword-arguments
  def initialize(id:, name:, type:, db:)
    @id =id, @name = name, @type = type, @db = db
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon(name, type) VALUES (?, ?)", name, type)
  end # save

  def self.find

  end # find

end # Pokemon
