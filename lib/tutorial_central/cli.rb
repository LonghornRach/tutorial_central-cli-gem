class TutorialCentral::CLI
  def call
    puts "Welcome to Tutorial Central!"
    basic_menu
  end

  def basic_menu
    choose do |menu|
      say 'Would you like to see categories or the latest tutorials?' 
      menu.prompt = "You can also type 'exit' to exit."
      menu.choice(:categories) {category_menu}
      menu.choice(:latest)  {display_tutorials}
      menu.hidden(:exit) {exit}
    end
  end

  def category_menu
    categories = TutorialCentral::Scraper.scrape_categories("http://hackr.io")
    options = categories.keys.to_a
    say "Here are the categories."
    choose do |menu|
      menu.prompt = 'Choose one.'
      menu.choices(*options) {|answer| display_tutorials(categories[answer],answer) }
    end  
  end

  def display_tutorials(url="http://hackr.io/latest", category="Latest")
    tutorials = TutorialCentral::Scraper.scrape_tutorials(url)
    options = tutorials.keys.to_a
    say "Here are the tutorials."
    choose do |menu|
      menu.prompt = 'Choose one.'
      menu.choices(*options) {|answer| say "#{answer} is located at #{tutorials[answer]}." }
    end
    if agree("Return to main menu?", true)
      basic_menu
    else
      say "Thank you for using Tutorial Central!"
      exit
    end
  end
  
end