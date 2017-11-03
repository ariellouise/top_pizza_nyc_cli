class TopPizzaNYC::CLI

  def call
    TopPizzaNYC::Scraper.scrape_pizza
    TopPizzaNYC::Scraper.scrape_name
    puts
    puts "Welcome to the Top 25 Pizza Places in NYC. I hope you brought your appetite!"
    puts
    list_pizza_joints
    start
  end

  def list_pizza_joints
    TopPizzaNYC::Pizza.all.each_with_index { |restaurant, index| puts "#{index + 1}. #{restaurant.name}"}
  end

  def start
    puts
    puts "Which pizza joint would you prefer to see first? Enter a number 1-25. To see the list again, type 'list'. To search descriptions, type 'search'."
    puts
    input = gets.strip
    if input.to_i.between?(1, 25)
      restaurant = TopPizzaNYC::Pizza.all[input.to_i - 1]
      display_restaurant(restaurant)
    elsif input == "list"
      list_pizza_joints
    elsif input == "search"
      search_descriptions

    else
      puts
      puts "That is not a valid input."
      start
    end

    puts "Would you like to see another pizza joint? Enter yes or no"
    puts
    input = gets.strip.downcase

    if input == "yes"
      start
    else
      puts "Not hungry enough? See you next time!"
      exit
    end
  end

   def search_descriptions
     puts "Please enter a keyword you would like to search"
     input = gets.strip
     pizzas = TopPizzaNYC::Pizza.search_descriptions(input)
     puts "Here are the restaurants that have the keyword #{input} in its description."
     pizzas.each do |pizza|
       puts "#{pizza.name}"
     end
   end

  def display_restaurant(restaurant)
    puts "---------#{restaurant.name}-----------"
    puts
    puts "Neighborhood:    #{restaurant.neighborhood}"
    puts "Address:          #{restaurant.address}"
    puts "Website:          #{restaurant.url}"
    puts

    puts "-----------Want More Info? Enter yes or no. Enter EXIT to quit-------------"
    input = gets.strip.downcase

    if input == "yes"
      puts
      puts "Description: #{restaurant.description}"
      puts
    elsif input == "no"
      start
    elsif input == "exit"
      puts
      puts "Not hungry enough? See you next time!"
      puts
      exit
    else
      puts
      puts "Invalid input. Please enter yes, no or EXIT to quit."
      puts
      display_restaurant(restaurant)
      puts
    end
  end
end
