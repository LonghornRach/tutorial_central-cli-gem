module TutorialCentral
  class Scraper

    def self.scrape_categories(url)
      site = Nokogiri::HTML(open(url))
      categories = []
      rows = site.css("tr.search_blocks")
      rows.each do |row|
        categories << row.css("a").text.strip
      end
      categories      
    end

    def self.scrape_tutorials(url)
      site = Nokogiri::HTML(open(url))
      tutorials = {}
      rows = site.css("div.date div.day")
      rows.each do |row|
        title = row.css("a.js-tutorial").first.attr("title")
        url = row.css("a.js-tutorial").first.attr("href")
        tutorials[title] = url
      end
      tutorials
    end

  end
end