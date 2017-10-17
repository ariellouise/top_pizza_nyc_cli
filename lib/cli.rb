class TopPizzaNYC::CLI

  def call
    TopPizzaNYC::Scraper.new
    puts "Welcome to the 25 Best Pizza Places in NYC. I hope you brought your appetite!"
    start
  end

  def start
    puts "Which pizza joint would you prefer to see first? Enter a number 1-25."
    input = gets.strip.to_i

    restaurant = TopPizzaNYC::Pizza.all[input.to_i - 1]

    display_restaurant(restaurant)

    puts "Would you like to see another pizza joint? Enter Y or N"
    input = gets.strip.downcase

    if input == "y"
      start
    else
      puts "Not hungry enough? See you next time!"
      exit
    end
  end

  def display_restaurant(restaurant)
    puts "**** #{restaurant.name} ****"
    puts " "
    puts "Neighborhood:    #{restaurant.neighborhood}"
    puts "Location:        #{restaurant.location}"
    puts "Website:         #{restaurant.website_url}"

    puts "****Want More?****"
    puts " "
    puts "#{restaurant.want_more?}"
  end
end
