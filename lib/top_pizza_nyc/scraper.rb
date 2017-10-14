class TopPizzaNYC::Scraper
 URL = 'http://www.complex.com/pop-culture/2011/09/the-25-best-pizza-places-in-new-york/marios-pizza'

  def get_page
    Nokogiri::HTML(open(URL)) #page to scrape
  end

  def scrape_pizza
    self.get_page.css("p").each do |pizza_box| #calling the above get_page method to find all the text in each 'p' tag
      pizza_joint = NewPizza::Pizza.new()


     # attributes
      pizza_joint.neighborhood = pizza_box("a").text #grabs neighborhood from text
      pizza_joint.address = pizza_box.css("a").text.split('.')[0] #grabs address via #split with a '.' to separate url from the address
      pizza_joint.url = pizza_box.css("a").text.split('.')[1,2].join('.') || "None Listed" #joining the url array or givng the none listed option.

    end
  end

  def scrape_pizza_joint_name
    self.get_page.css("h1").each do |header|
      return name
  end

      pizza_box("h1").text



 end
end
