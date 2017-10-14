class TopPizzaNYC::CLI

  def call
    TopPizzaNYC::Scraper.new
    puts "Welcome to the 25 Best Pizza Places in NYC. I hope you brought your appetite!"
    start
  end

  def start
    puts "Which pizza joint would you prefer to see first? 1-5, 5-10, 10-15, 15-20, 20-25?"
    input = gets.strip.to_i
    display_pizza_joint(pizza_joint)

    puts "Would you like to see another pizza joint? Enter Y or N"
    input = gets.strip.downcase

    pizza = TopPizzaNYC.find[input.to_i - 1]

  if input == "y"
    start
  else
    puts "Not hungry enough? See you next time!"
    exit
  end

  def display_pizza_joint(pizza_joint)
    puts "**** #{pizza_joint.name} ****"
    puts " "
    puts "Neighborhood:    #{pizza_joint.neighborhood}"
    puts "Location:        #{[pizza_joint.location]}"
    puts "Website:         #{pizza_joint.website_url}"

    puts "****Want More?****"
    puts " "
    puts "#{pizza_joint.want_more?}"
  end


end
end
