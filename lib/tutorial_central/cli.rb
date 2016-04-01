module TutorialCentral
  class CLI
    def call
      puts "Welcome to Tutorial Central!"
      basic_menu
    end

    def basic_menu
      choose do |menu|
        menu.prompt = 'Would you like to see categories or the latest tutorials?'
        menu.choice(:categories, &category_menu)
        menu.choice(:latest, &display_tutorials)
      end
    end

    def category_menu
      categories = Scraper.new.scrape_categories("http://hackr.io")
      options = categories.keys.to_a
      say "Here are the categories."
      choose do |menu|
        menu.prompt = 'Choose one.'
        menu.choices(*options) {|answer| display_tutorials(categories[answer],answer) }
      end  
    end

    def display_tutorials(url="http://hackr.io/latest", category="Latest")
      tutorials = Scraper.new.scrape_tutorials(url)
      options = tutorials.keys.to_a
      say "Here are the tutorials."
      choose do |menu|
        menu.prompt = 'Choose one.'
        menu.choices(*options) {|answer| say "#{answer} is located at #{tutorials[answer]}." }
      end
      if agree("Return to main menu?", true)
        category_menu
      else
        say "Thank you for using Tutorial Central!"
        exit
      end
    end
    
  end
  
end