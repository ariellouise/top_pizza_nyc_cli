class TopPizzaNYC::Pizza

  attr_accessor :name, :neighborhood, :address, :url

  @@all = []

  # need another method here?

  def initialize(name=nil, neighborhood=nil, address=nil, url=nil)
    @name = name
    @neighborhood = neighborhood
    @address = address
    @url = url
    @@all << self
  end

  def self.all
    @@all
  end

end
