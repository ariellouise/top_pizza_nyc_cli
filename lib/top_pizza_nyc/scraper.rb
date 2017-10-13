class BestPizzaNYC::Scraper
 URL = 'http://www.complex.com/pop-culture/2011/09/the-25-best-pizza-places-in-new-york/marios-pizza'

  def get_page
    Nokogiri::HTML(open(URL)) #page to scrape
  end

  def scrape_pizza
    self.get_page.css("p").each do |pizza_box|
      pizza_joint = NewPizza::Pizza.new()

      pizza_joint.address = pizza_box.css("a").text.split('.')[0]
      pizza_joint.url = pizza_box.css("a").text.split('.')[1,2].join('.')
    end
  end
end 
