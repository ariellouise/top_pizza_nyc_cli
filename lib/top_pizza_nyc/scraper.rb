class TopPizzaNYC::Scraper
 URL = 'https://amp.www.complex.com/pop-culture/2011/09/the-25-best-pizza-places-in-new-york/'

  def self.get_page
    Nokogiri::HTML(open(URL)) # page to scrape
  end

  def self.scrape_pizza
    page = self.get_page

    page.css('div.article__copy').each_with_index do |pizza_box, i|
      if i != 0
        restaurant = TopPizzaNYC::Pizza.new

        restaurant.neighborhood = pizza_box.css("p").text.split(/Neighborhood:|Address:/)[1] # grabs neighborhood from text
        restaurant.address = pizza_box.css("a").text.split('.')[0] # grabs address via #split with a '.' to separate url from the address
        restaurant.url = pizza_box.css("p").text.match(/\w+\.com/) || 'None Listed' # joining the url array or givng the none listed option.
        restaurant.description = pizza_box.css("p").text.split(/\.com|n\/a/)[1]
      end
    end
  end

  def self.scrape_name
    page = self.get_page
    page.css('h1').each_with_index { |pizza_box, i| TopPizzaNYC::Pizza.all[i].name = pizza_box.text.split(/\d+\.\s/)[1] }
  end
end
