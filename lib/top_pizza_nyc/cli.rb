class TopPizzaNYC::CLI
  def call
    TopPizzaNYC::Scraper.scrape_pizza
    TopPizzaNYC::Pizza.all.shift #gets rid of the first unnecessary item in the @@all array
    @names = TopPizzaNYC::Scraper.scrape_name
    TopPizzaNYC::Pizza.all.map { |pizza_place| pizza_place.name = @names.shift }
    puts #for space
    puts "Welcome to the Top 25 Pizza Places in NYC. I hope you brought your appetite!"
    puts #for space
    start
  end

  def start
    puts "Which pizza joint would you prefer to see first? Enter a number 1-25."
    TopPizzaNYC::Pizza.all.each.with_index(1) { |restaurant, index| puts "#{index}. #{restaurant.name}"}
    input = gets.strip.to_i

    restaurant = TopPizzaNYC::Pizza.all[input.to_i - 1]

    display_restaurant(restaurant)

    puts "Would you like to see another pizza joint? Enter yes or no"
    input = gets.strip.downcase

    if input == "yes"
      start
    else
      puts "Not hungry enough? See you next time!"
      exit
    end
  end

  def display_restaurant(restaurant)
    puts "---------#{restaurant.name}-----------"
    puts
    puts "Neighborhood:    #{restaurant.neighborhood}"
    puts "Address:          #{restaurant.address}"
    puts "Website:          #{!restaurant.url.empty? ? restaurant.url : 'None Listed.'}"
    puts

    puts "---------Want More Info? Enter yes or no. Enter EXIT to quit-------------"
    input = gets.strip.downcase

    if input == "yes"
      puts #for space
      puts "Description: #{restaurant.description}"
      puts #for space
    elsif input == "no"
      start
    else
      puts #for space
      puts "Not hungry enough? See you next time!"
      puts #for space
      exit
    end
  end
end
