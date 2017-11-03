class TopPizzaNYC::Pizza

  attr_accessor :name, :neighborhood, :address, :url, :description

  @@all = []

  def initialize(name=nil, neighborhood=nil, address=nil, url=nil, description=nil)
    @name = name
    @neighborhood = neighborhood
    @address = address
    @url = url
    @description = description
    @@all << self
  end

  def self.search_descriptions(keyword)
    restaurants = []
    self.all.each do |pizza|
      if pizza.description.include? keyword
        restaurants << pizza
      end
    end
    restaurants
  end


  def self.all
    @@all
  end
end
