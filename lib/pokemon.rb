require 'pry'

class Pokemon

  attr_accessor :id, :name, :type, :db

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
  end

end

Pokemon.new(id: 1, name: "Pikachu", type: "electric", db: @db)
