class BestPizzaNYC::Scraper
 URL = 'http://www.complex.com/pop-culture/2011/09/the-25-best-pizza-places-in-new-york/marios-pizza'

  def get_page
    Nokogiri::HTML(open(URL)) #page to scrape
  end

  def scrape_pizza
    self.get_page.css("div.list-slide__copy article__copy p").each do |pizza|
      pizza = NewPizza::Pizza.new()

      pizza_info =

    end
 
