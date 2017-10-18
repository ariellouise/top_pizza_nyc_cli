class TopPizzaNYC::Scraper
 URL = 'https://amp.www.complex.com/pop-culture/2011/09/the-25-best-pizza-places-in-new-york/'

  def self.get_page
    Nokogiri::HTML(open(URL)) # page to scrape
  end

  def self.scrape_pizza
    page = self.get_page

    page.css('div.article__copy').each do |pizza_box| # calling the above get_page method to find all the text in each 'p' tag
     restaurant = TopPizzaNYC::Pizza.new() # restaurant is currently an empty pizza object

     # attributes
      #restaurant.name = pizza_box.css("h1").text
      restaurant.neighborhood = pizza_box.css("p").text.split(/Neighborhood:|Address:/)[1] #grabs neighborhood from text
      restaurant.address = pizza_box.css("a").text.split('.')[0] #grabs address via #split with a '.' to separate url from the address
      restaurant.url = pizza_box.css("a").text.split('.')[1,2].join('.') || "None Listed" #joining the url array or givng the none listed option.
    end
  end

  def scrape_pizza_joint(restaurant)
    self.get_page.css("h1").each do |header|
      return name
    end
     pizza_box("h1").text
  end
end

# page.css('div.article__copy').each {|work| puts "#{work.text} \n\n"}
