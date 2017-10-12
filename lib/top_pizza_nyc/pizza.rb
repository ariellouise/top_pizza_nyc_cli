class TopPizzaNYC::Pizza

  attr_accessor :name, :neighborhood, :location, :website_url

  @@all = []

  # need another method here?

  def initialize(name=nil, neighborhood=nil, location=nil, url=nil)
    @name = name
    @neighborhood = neighborhood
    @location = location
    @url = url
    @@all << self
  end

  def self.all
    @@all
  end
