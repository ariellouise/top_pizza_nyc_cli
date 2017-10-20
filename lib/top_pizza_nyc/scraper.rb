class TopPizzaNYC::Scraper
 URL = 'https://amp.www.complex.com/pop-culture/2011/09/the-25-best-pizza-places-in-new-york/'

  def self.get_page
    Nokogiri::HTML(open(URL)) # page to scrape
  end

  def self.scrape_pizza
    page = self.get_page

    page.css('div.article__copy').each do |pizza_box| # calling the above get_page method to find all the text in each 'p' tag
     restaurant = TopPizzaNYC::Pizza.new # restaurant is currently an empty pizza object

     # attributes
      restaurant.neighborhood = pizza_box.css("p").text.split(/Neighborhood:|Address:/)[1] # grabs neighborhood from text
      restaurant.address = pizza_box.css("a").text.split('.')[0] # grabs address via #split with a '.' to separate url from the address
      restaurant.url = pizza_box.css("a").text.split('.')[1,2].join('.') # joining the url array or givng the none listed option.
      restaurant.description = pizza_box.css("p").text.split(/.com|n\/a/)[1]
    end
  end

  #@@all = [all the things]
  def self.scrape_name
    names = []
    page = self.get_page
    page.css('h1').each { |pizza_box| names << pizza_box.text.split(/\d+\.\s/)[1] }
    return names
  end
end

#Lauren's name selector:
#restaurant.name = page.css('h1').each { |pizza_box| adds << pizza_box.text.split(/\d+\.\s/)[1] } 
