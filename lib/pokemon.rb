class Pokemon
  attr_accessor :id, :name, :type, :db

  @@all = []

  def initialize(id: , name: , type: , db: )
    @id = id
    @name = name
    @type = type
    @db = db
    @@all << self
  end

  def self.save(name, type, db)
    pokemon = db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
    @@all << pokemon
  end

  def self.find(id, db)
    binding.pry
    db.execute("SELECT * FROM pokemon WHERE id = (?)", id)
    Pokemon.new()
  end


end
