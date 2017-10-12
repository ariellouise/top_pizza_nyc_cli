class BestPizzaNYC::CLI

  def calls
    BestPizzaNYC::Scraper.new
    puts "The 25 Best Pizza Places in NYC. I hope you brought your appetite!"
    start
  end

  def start
  end
