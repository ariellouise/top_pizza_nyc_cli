class BestPizzaNYC::CLI

  def call_method
    BestPizzaNYC::Scraper.scrape_pizza
    puts "The 25 Best Pizza Places in NYC. I hope you brought your appetite!"
    start_method
  end

  def start_method
    puts "Which pizza joint would you prefer to see first? 1-5, 5-10, 10-15, 15-20, 20-25?"


    input = gets.strip.to_i

    display_pizza_joint(pizza_joint)

    puts "Would you like to see another pizza joint? Enter Y or N"
    input = gets.strip.downcase
  end
end
